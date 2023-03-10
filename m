Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09286B406B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacoC-0008L4-K0; Fri, 10 Mar 2023 08:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1paco8-0008JS-7t
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:29:16 -0500
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1paco1-0001NS-EB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:29:11 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 264799222
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:H0Tz1q028kf5b1vhAPbD5W5zkn2cJEfYwER7XKvMYLTBsI5bp2cDy
 GYaXz3UafmPa2D3Lt5wPInl/B5TupCGytdiQQVoqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYgr414rZ8Ek05K+r4GtB1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1TSxoLGpQX+t9zX0xo1
 tNbMjYoKSqM0rfeLLKTEoGAh+wmJcjveZoB4zRuk2CfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNIL2Q+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvTSMnV0riuKF3Nz9e5+pQ/dts2Okj
 Gfoxk/UCUsgOtCk8G/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zR36KZspQqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXQDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:4KYadatZBX0LRZfu7fvMi1a37skDTNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO3lHYTr2KhrGSoAEIdReOkdJ15O
 NNdLV/Fc21LXUSt7ed3OBgKadE/DBQytHNudvj
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Mar 2023 08:29:03 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 l13-20020ad44d0d000000b004c74bbb0affso2896573qvl.21
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678454942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IVAb1IqRVfp8sASXxsWMKS7HQE1YgiPgF4PP0pF794Y=;
 b=Dg4dt/0FHVt+T7MQWVIsV6juE5F5xBQqZPYMkhpSDmWYi7OwQHkACYd2Pqt/3l5Tbf
 5yZB6sLHxlPJN7zFCLr0MMsSuzWU6F2nvzRrrFYoK8FZDtCk5D3vA4rTL2x3GCmLJvZt
 8CKCpCalj4pg43BXPTJXZGYgHj/PTQ5ms/cKfMbC8ScgejkVnx7nDQt0kD59uiaPpVMd
 hrf6PIvcJ4QJuWus2+dFQXkoxI0JZ7R3Bjfsj2/gBdngJkA0Yga0sUH2EGWQOwhpg+7h
 rZAP6+C+G/r7o8+1nGb5bdLyBinJGLp+4Wi47BXeHlU+N47BWK4roLQRiDyao8H5i4da
 LoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678454942;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IVAb1IqRVfp8sASXxsWMKS7HQE1YgiPgF4PP0pF794Y=;
 b=BJM5Lruxgd5JIvALX0RdEkyuyA/fCzf1Fvv8JiEnW7ohwAWar02DoyPCCIDYgnYiz+
 BWUHscrtWBpqwMzhqEdurzEtkBB9eP44IaYymXxCzh4qUCEIWxiseKPkazKdcyLmzLV+
 1zYVWihol/ul1UJ3qIsZUXGi/zAjZlaBjOTv0tzHrEObGDEIG/UCwWfqPg0KY3rc+WY4
 i4FPLKwPeUALpKO8giyH45pyr/dxbJOuxIceNiEudbzuz+TDo0wbMhse/mvUJBPCVdrI
 NFfTSyCX6Q+zLpZuarIluj9eE8xy62GS4quGeYnN9AzXALkDFbKjDMe6006Lbwp3LYbO
 ewNA==
X-Gm-Message-State: AO0yUKWbXLEBRkGsYO/sHCyyItPtWry2l08P/mywSFQD/SPRJ/E4hGZa
 hi4f76N6TsUpj37VKBkQSQK5crY4VkWJQrkRR8gzS9J0ucXQbfdMFjFFttypJrDOJLZOa3GncHx
 NPmfcZy7WtkwrRrikgRtodRALMWWKuA==
X-Received: by 2002:a05:622a:198c:b0:3bf:c6c9:2f29 with SMTP id
 u12-20020a05622a198c00b003bfc6c92f29mr41433720qtc.27.1678454942635; 
 Fri, 10 Mar 2023 05:29:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8pYcCI/jAy+wsJXHots6+oHJ5FLLOLI059hrA6NIUgnP/SGYHSqQbTHk2zOspdRUD9Z3YrNg==
X-Received: by 2002:a05:622a:198c:b0:3bf:c6c9:2f29 with SMTP id
 u12-20020a05622a198c00b003bfc6c92f29mr41433680qtc.27.1678454942381; 
 Fri, 10 Mar 2023 05:29:02 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 t14-20020ac865ce000000b003bfbfd9a4aesm1343152qto.56.2023.03.10.05.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 05:29:02 -0800 (PST)
Date: Fri, 10 Mar 2023 08:28:58 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
Message-ID: <20230310132858.dljb2wgx325shtgd@mozz.bu.edu>
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
 <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
 <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
 <20230310130245.oyjdeihisuvgl6rz@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310130245.oyjdeihisuvgl6rz@mozz.bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230310 0802, Alexander Bulekov wrote:
> On 230310 1245, Peter Maydell wrote:
> > On Fri, 10 Mar 2023 at 12:32, Alexander Bulekov <alxndr@bu.edu> wrote:
> > > This MR seems to be "lsi-ram".
> > >
> > > From hw/scsi/lsi53c895a.c:
> > >
> > > memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
> > >         "lsi-ram", 0x2000);
> > >
> > > So the LSI device is reading an LSI "Script" from its own IO region.. In
> > > this particular case, I think there was no reason to use
> > > memory_region_init_io rather than memory_region_init_ram, but this makes
> > > me worried that there are other devices that use something like this.
> > 
> > This particular device predates the entire MemoryRegion set of
> > abstractions, so it might have seemed easier at the time.
> > The endianness handling of the current code is also a bit
> > confusing and might make it tricky to convert to a RAM MR.
> 
> With my trivial mr_io - > mr_ram conversion, I no longer hit the
> re-entrancy tracepoint, and my livecd boots, but it's probably not
> exhaustively using the script functionality.. 
> 
> Does the endianness actually cause a problem? As long as all accesses
> (CPU -> LSI_RAM and LSI -> LSI_RAM) occur through the address_space API,
> are we safe?
> -Alex

Or maybe a rom_device with memory_region_rom_device_set_romd(romd_mode =
false) is better here?


