Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B061F484CDB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 04:26:31 +0100 (CET)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4wwY-0007Gb-I6
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 22:26:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4wms-0007jL-5d
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 22:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4wmn-0006A9-Mu
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 22:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641352583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uz/Wq2I1yzAmPYlhBfcUNJhlL+1flxGLAqaVgXTMEOA=;
 b=Gls60b5GIbgRJs6CZ/hjhb9e0+TYqKrvdYiJ7uL2NnRVvNO8+/b+s8U1/iFJWftR6bY6Lt
 Cz2PsZc1s+jyBMSohNFAZq6E6pKaGeInGA1Nt/QxaU8NddofX9OZv/pMtHnwKNBfspLAaY
 a0xUzIu5hx4Y1VUjWUbMQVWslFlxGe0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-rQx11IfMPda8i1i0k2f5bg-1; Tue, 04 Jan 2022 22:16:22 -0500
X-MC-Unique: rQx11IfMPda8i1i0k2f5bg-1
Received: by mail-lf1-f71.google.com with SMTP id
 z23-20020a0565120c1700b004258a35caf2so8754568lfu.13
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 19:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uz/Wq2I1yzAmPYlhBfcUNJhlL+1flxGLAqaVgXTMEOA=;
 b=gANq6az+Cif7QtQIB+oQLpwEtUyQRhbC5rx0OcjUZQKEJJ10xOdy4UP/npoJGFclV4
 4oEsv1BOdZoRVFZHzarTh0LRoa7S2IDF1mnfrnZ2jgoHLr0P85wKJq5Wa+gyM+uOwl/m
 cgH1oL4LSfN3uUyDUPSOOcTX8roa5i024h3KKuGUSo5luZW4h0Y9eFc6FT8AvqGoJBdi
 B17WgLKqH4ay9WzVe9uZ6LNMU+hAiaHdGzlrOCDb3lX+v80GFSN+eo6smmDBCJOvWf5I
 FGuiJrl381BQLP5JGNUSC90HL2d5khy7keMerPOOu2T50CXF8OFPPcNmq57NfgW2C5MZ
 F3fA==
X-Gm-Message-State: AOAM532TIT/++XG7lP3mg/so8AZocK7gZtBSE8zaqrrVTHoN/kOMG93C
 7hi122fcX+aoWkNTPr04w7yHDMIvH7ijZkqqQO12SjVsok1wzvrLRFMnGAfiAdq86jqngRv7AVp
 x2AlAK5tfZUu5RAvxvHu1WTH19gSPh0E=
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr41742019ljk.420.1641352581185; 
 Tue, 04 Jan 2022 19:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKfC6c3Eqoijn1gLX9FIKbsX41WsZxx7x+0DsXdPgApZ23FKXTvkN4Gsqc/uJ8hN+VuTvnixW/QdSVlzOI3Dc=
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr41742011ljk.420.1641352580930; 
 Tue, 04 Jan 2022 19:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20220104211827.3260431-1-venture@google.com>
 <CAO=notzyC8icquKrrQZMJRZ5Dqvh3rj0OMw+A1_6iMUTbjSCHw@mail.gmail.com>
In-Reply-To: <CAO=notzyC8icquKrrQZMJRZ5Dqvh3rj0OMw+A1_6iMUTbjSCHw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 5 Jan 2022 11:16:10 +0800
Message-ID: <CACGkMEuMuvR73s4QFq3jNP-e5V-EZ+mwzCfXLY4jnaLrs0BaXA@mail.gmail.com>
Subject: Re: [PATCH] Set return code on failure
To: Patrick Venture <venture@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Foley <pefoley@google.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 5, 2022 at 5:32 AM Patrick Venture <venture@google.com> wrote:
>
>
>
> On Tue, Jan 4, 2022 at 1:18 PM Patrick Venture <venture@google.com> wrote:
>>
>> From: Peter Foley <pefoley@google.com>
>>
>> Match the other error handling in this function.
>
>
> Just noticed I didn't fix up the commit title here to match style.  Should I do a PATCH RESEND or a new patch, or can you add the "net/tap: " to the title before applying (should it be accepted).

Please resend.

Thanks

>
>>
>>
>> Signed-off-by: Peter Foley <pefoley@google.com>
>
> Reviewed-by: Patrick Venture <venture@google.com>
>>
>> ---
>>  net/tap.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/net/tap.c b/net/tap.c
>> index f716be3e3f..c5cbeaa7a2 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -900,6 +900,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
>>              if (i == 0) {
>>                  vnet_hdr = tap_probe_vnet_hdr(fd, errp);
>>                  if (vnet_hdr < 0) {
>> +                    ret = -1;
>>                      goto free_fail;
>>                  }
>>              } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
>> --
>> 2.34.1.448.ga2b2bfdf31-goog
>>


