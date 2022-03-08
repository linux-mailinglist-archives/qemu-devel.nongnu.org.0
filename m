Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF74D151D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:49:07 +0100 (CET)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXOr-0002aX-EJ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXMF-00013z-P0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXMC-00064e-Lj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646736378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ir4eth+8SXEAvu2iu7KvlL909Ar2sGBjZGhyG6OKBvE=;
 b=XE3dJlT/risc6XLCQwmtD+Gp5rBbqZQ+xI1SLkbGeAWWa7jr9wNpWHIFNUv0SjgvkRjPEk
 yotaLQrVmDNnOA/I3D3GJpkUGQ6ZtDQiH+62U7EB/TPk1u6FQq2f/sO09wEdD0Im7wso0S
 LdjFdZyKDSyS81kM7+3zMQyE8Op0dBM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-dr7f8dC4PjWCAlO1DsQJuw-1; Tue, 08 Mar 2022 05:46:17 -0500
X-MC-Unique: dr7f8dC4PjWCAlO1DsQJuw-1
Received: by mail-ej1-f69.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so8462814ejc.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ir4eth+8SXEAvu2iu7KvlL909Ar2sGBjZGhyG6OKBvE=;
 b=ufxWVxfqVbi52yrmiOhGUuoFVNG6BOZFNxb1kjk+HBbobsWVwUDjugFx465/IG/aIb
 4cmj6wQ09F3C0opoLYK9ZYkplk30LHLycdUBfDTD3yFXwhvrxgEWzvacCdEmzsFwxkBh
 n60ijtuEKZ0SNdMYMz6aBEFaEkMowB2C1PR4FfDmDzvp+FnzC5L/qnYd7kjZjzYbJu7n
 j/4yfNTsVVD/tNAS5cLpDnaUwRLlPthSE1rX0wmktZvyqyCpjAwmSP2Xw9nRojQbQtxO
 /QguXefPAaPlIkQhVAwuu/XKLInO5TVG2rdF1Cf8rjfPDC19OBWE9lQr8jtNFu/Yainh
 6flA==
X-Gm-Message-State: AOAM530HNQS7+uTfuL9hoszOyKNXeGRWVapLHKNBFES0FG4TsSvm1dFs
 AJqHvZja0yLGJiWK9nzOPzZaPdLRIpa8WIQZyFjGxGWG9TCv9NWZnAShnqb71I+/kKJTOUDFxuh
 pNO8e2EJ/BGp3Rm4=
X-Received: by 2002:aa7:c5d7:0:b0:415:ee77:d6f2 with SMTP id
 h23-20020aa7c5d7000000b00415ee77d6f2mr15566319eds.208.1646736376539; 
 Tue, 08 Mar 2022 02:46:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztJ1XPjjMKydcCWNB4A1TRlRhUc+HOKibm3mmtdw3nibRNcdVRjv2cCSorjNhOwjHxV8IHxw==
X-Received: by 2002:aa7:c5d7:0:b0:415:ee77:d6f2 with SMTP id
 h23-20020aa7c5d7000000b00415ee77d6f2mr15566287eds.208.1646736376326; 
 Tue, 08 Mar 2022 02:46:16 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 u9-20020a170906124900b006ce88a505a1sm5851858eja.179.2022.03.08.02.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:46:15 -0800 (PST)
Date: Tue, 8 Mar 2022 05:46:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
Message-ID: <20220308054213-mutt-send-email-mst@kernel.org>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> Generally, yes.


So generally I support the idea of merging code gradually.  And merging
with an unstable flag to enable it is a reasonable way to do it.
However we are half a day away from soft freeze, so this will just
result in the feature getting to users in it's current not really
useable form. If we just want to simplify upstreaming then
merging patches 1-14 for now would be one way to do it.
If you want to do it through your tree then ok

Acked-by: Michael S. Tsirkin <mst@redhat.com>


-- 
MST


