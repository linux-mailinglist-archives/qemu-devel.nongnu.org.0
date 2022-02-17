Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F54B9BDE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:17:40 +0100 (CET)
Received: from localhost ([::1]:39494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcux-0006C9-1d
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:17:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKcDm-0000K9-3q
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:33:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKcDj-0002YK-Bj
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645086774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnZFY34RUla82X3wnjCAFZpjMr3CeoA4C9Gd95MtbQA=;
 b=cTGrUB1Pd8f4w+5+yn6ZH9yfyZz+3BmvVrcZ+mopy90P7SI8lhX5RRF9hoxiiNHMfyjz6V
 GUz9N2b91umWLjJYVyc1ojm7SPRmx8Q9L0D3sINAABzME+OOsXbAhM2hFN+0YjVpo5odIB
 dX3MgX7E6PsRwt7/Yeb7enFus6Bzn5A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-gG3RYgUFM4a4rPpnqIbDkw-1; Thu, 17 Feb 2022 03:32:51 -0500
X-MC-Unique: gG3RYgUFM4a4rPpnqIbDkw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b17-20020a05600c4e1100b0037cc0d56524so3920842wmq.2
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:32:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=pnZFY34RUla82X3wnjCAFZpjMr3CeoA4C9Gd95MtbQA=;
 b=7GgoGupOeSBOjHBTNgQsSAEg3qm4W6h9mBVlpNNX7qliEMHpFKgNm5C5zRM5Iv3MIa
 SeiQN2FP+sEHV4S7kFrsLyo3gM+EhytJJGa3aSlmpp7Qr7v3Kob6uJwTekMEHXiegsxG
 +ZdRQ3i2bBaa5YyooCGp6yA9IK8EBnZJxfmOtc7ROiwylX68h+2Vy6BcVcFcHd5td9JO
 mIhHeJ329PnD4KhEEMWVI3rYksvNgQWF7PT7shB5ygp0ptSWx0hxx7K4Twmd7/1tAwde
 s+r+UR7n/DOiZF8HiwqBEesCT/+PLdTUL6sIVHSWmzqPs6kV5LMBpAXlT6JhS8UtkCoP
 SXHQ==
X-Gm-Message-State: AOAM531VOZHxMdYIwyKRGbXFvXfpaCNsOm0aaKr+Io+DcGoxJuuNkmJD
 ycaQn07mM/X9l/fZ/o3FGYN8JyS4vRNHe/y1THN8q7Kv/mminyOypYGHfIC51vByasQNftwt6ue
 z1XiI1YOkVw+4PDk=
X-Received: by 2002:adf:fe02:0:b0:1e3:266:d1c with SMTP id
 n2-20020adffe02000000b001e302660d1cmr1376133wrr.582.1645086769831; 
 Thu, 17 Feb 2022 00:32:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9Q7I370vP6x2g3/2ykcxzG++9IG0MxfNsqda5BiXYdFvoq9D6s+DxidiTk4qOIR6KF0pmVQ==
X-Received: by 2002:adf:fe02:0:b0:1e3:266:d1c with SMTP id
 n2-20020adffe02000000b001e302660d1cmr1376123wrr.582.1645086769628; 
 Thu, 17 Feb 2022 00:32:49 -0800 (PST)
Received: from redhat.com ([2.55.139.83])
 by smtp.gmail.com with ESMTPSA id a10sm9296120wri.74.2022.02.17.00.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:32:49 -0800 (PST)
Date: Thu, 17 Feb 2022 03:32:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gautam Dawar <gdawar@xilinx.com>
Subject: Re: [PATCH 2/2] Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa
 devices
Message-ID: <20220217032859-mutt-send-email-mst@kernel.org>
References: <20220215072231.2498-1-gdawar@xilinx.com>
 <20220215072231.2498-3-gdawar@xilinx.com>
 <CACGkMEt8UN8vd4KNKM7=Kcx28J2ANvLYN62NNzg9d5pHKhK4sQ@mail.gmail.com>
 <BY5PR02MB698031726B87245DAD482982B1369@BY5PR02MB6980.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB698031726B87245DAD482982B1369@BY5PR02MB6980.namprd02.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Martin Petrus Hubertus Habets <martinh@xilinx.com>,
 eperezma <eperezma@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Tanuj Murlidhar Kamde <tanujk@xilinx.com>, Pablo Cascon <pabloc@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 08:27:14AM +0000, Gautam Dawar wrote:
> [GD>>] Yes , I agree a complete solution that will support the
> emulated virtio device with in_order rx/tx virtqueue functions will
> definitely be better but at the same time it will take considerable
> amount of time and effort. I also noticed that something similar
> (https://patchew.org/QEMU/1533833677-27512-1-git-send-email-i.maximets@samsung.com/)
> was proposed years ago which got dropped for similar reasons and it
> has been status quo since then.


Not applying a patch until it's complete is really the only
leverage maintainers have to push for complete patches.
Otherwise people keep adding half-baked code and hoping
that someone else does the rest of the work.

>  So, unless we know that this work is
> already in progress & will be up-streamed soon and if you don’t see
> any side-effects of this patch, we can get it integrated first and
> then this can be reverted when the complete solution is available.
> This would help in benchmarking performance boosts achieved with
> IN_ORDER feature.

You can just carry the patch in private for benchmarking I guess?

-- 
MST


