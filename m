Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0E41FB062
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:23:57 +0200 (CEST)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlAdA-0005bD-6d
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jlAbu-00059R-Ug
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:22:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20366
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jlAbt-0003Z8-42
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592310156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmG/GHnwHM2A6nFQMrxM1jBNVWSVl+EoOEMOxGlQCNU=;
 b=BvE2yV31Q0tYcSu96reuUmSVqle/AEVpf/pB0C2AdCJt/zjURyPYBQM60KSw+aoVUc4dTF
 ZEU0CLdCwQ+30pzAGdcBSraP1Uq597qE15J+3q9MrEKXwjXIK7EvaIwSu10GR4RvPBm1lf
 XZbEE548deyqQGaw/K0nxaGRVfYlQyo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-wpLZEy2vMVaQjIRfTnNRFQ-1; Tue, 16 Jun 2020 08:22:32 -0400
X-MC-Unique: wpLZEy2vMVaQjIRfTnNRFQ-1
Received: by mail-pj1-f72.google.com with SMTP id ge4so2099168pjb.7
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 05:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MmG/GHnwHM2A6nFQMrxM1jBNVWSVl+EoOEMOxGlQCNU=;
 b=qUEPMmLoNhxenP8kKXxwUhFfoP5la2Li+rFq4PImxkbl6T52Mpz2z8w7sQ1xiWBU5j
 hWNnZIpoZMZDneVMy+Yd32v9TYQgnjft5YZtNRxZd1YvzfJa1ujTPwOU+NNajDsCofNu
 9NNkelzpEG4K0rIs0sxlHmUpxmkEqLJpeBs3iPe+aIKoFcxRv87bDOQ9YNG8BN5jV/9U
 EmiraWopN2VMWSwvzYgWTR6rutf0f3KjJY58aZlrIQoKXQbJ543CQPP3P4PyyHSRGagk
 nTzyIIAA9AnV3+eCqea2XcVN5j8+X0zuQS7XGkN/SmdN+NlpBx4WSe3A++IUC3LHuqP5
 yi+Q==
X-Gm-Message-State: AOAM532nZf1SAnoB9DSo93nincrszW8F7nOT4bvWKzuTwNk+9vn+Sqwi
 B7mwdgYa3rSNXcCjtE85g6m/VLBfbzvoY40ovopCBd+BRHUqvw2+t4rS7GjjBkPOhf5//BMWsKh
 SE7y4/s8sNO3gfS4Cg4qXb1VqYveq08U=
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr1777453plb.274.1592310151806; 
 Tue, 16 Jun 2020 05:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt2v0QF+mWISNEpNCE3D02zQCxOtlg+ye5p2eB3GOqfSgBvaQVgQ/wMEejt0/gpRmuHPMfZRveJH1IlzVYnwY=
X-Received: by 2002:a17:902:ee12:: with SMTP id
 z18mr1777425plb.274.1592310151595; 
 Tue, 16 Jun 2020 05:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200529140620.28759-1-lulu@redhat.com>
 <20200529140620.28759-4-lulu@redhat.com>
 <c0321600-c0ff-2269-be35-33095b443d13@redhat.com>
In-Reply-To: <c0321600-c0ff-2269-be35-33095b443d13@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 16 Jun 2020 20:22:20 +0800
Message-ID: <CACLfguUxmGTGfiy+yuViqqh56nkGYRgN9159AbBP=t3WYvN6sg@mail.gmail.com>
Subject: Re: [RFC v3 3/8] virtio-bus: introduce queue_enabled method
To: Laurent Vivier <lvivier@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lulu@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: rdunlap@infradead.org, Michael Tsirkin <mst@redhat.com>,
 mhabets@solarflare.com, qemu-devel@nongnu.org,
 Rob Miller <rob.miller@broadcom.com>, saugatm@xilinx.com,
 Markus Armbruster <armbru@redhat.com>, hch@infradead.org,
 Eugenio Perez Martin <eperezma@redhat.com>, jgg@mellanox.com,
 Jason Wang <jasowang@redhat.com>, Shahaf Shuler <shahafs@mellanox.com>,
 kevin.tian@intel.com, parav@mellanox.com,
 Vitaly Mireyno <vmireyno@marvell.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, Stefan Hajnoczi <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, Ariel Adam <aadam@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, hanand@xilinx.com, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 16, 2020 at 3:50 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 29/05/2020 16:06, Cindy Lu wrote:
> > From: Jason Wang <jasowang@redhat.com>
> >
> > This patch introduces queue_enabled() method which allows the
> > transport to implement its own way to report whether or not a queue is
> > enabled.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
>
> Cindy, you must add your signed-off-by on all the patch you send, after
> all the existing S-o-b.
>
sure will fix this
> >
> > 0005-virtio-bus-introduce-queue_enabled-method.patch
>
will remove this part

> bad cut&paste?
>
> Thanks,
> Laurent
>


