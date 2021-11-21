Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B97458626
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 20:36:46 +0100 (CET)
Received: from localhost ([::1]:56112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mosdp-0001ff-6r
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 14:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mosYK-00063t-C7
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 14:31:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mosYG-0004sw-SC
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 14:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637523048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0DpBYvFnbpENCIc2vWx5PWg7yTkQp8LJkc0XIjlMNt0=;
 b=Qew5i5xA+Gei0oK28XAPL+bc8arrVkGbgZ2L6oWQxc//+KQLm9aNOZt8OVO3gQ4/MTVzsH
 nWcs/teWifOEVvIK1PNoCekzp88KwDBElsn6yQ1uQuaeaO34eIK5gNGHGNEAstaza0x5B8
 QDTDFhHIS288VftNtbwSnube2UX1DFQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-gjg0QfNpPa-DNFheWc_Imw-1; Sun, 21 Nov 2021 14:30:47 -0500
X-MC-Unique: gjg0QfNpPa-DNFheWc_Imw-1
Received: by mail-pj1-f72.google.com with SMTP id
 x18-20020a17090a789200b001a7317f995cso10655252pjk.4
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 11:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0DpBYvFnbpENCIc2vWx5PWg7yTkQp8LJkc0XIjlMNt0=;
 b=6knGpMme3voO8cza8MFOUgW7K5/T6wl5DCnk2ZyDPDSnbr0PQoeor1rlXkjNEbTNwc
 8uBy02x787UZctt9G0l1TKn1qJmETbwSQehWouMPefTGYHVv2nHPUmTscm0dgTLiWTX4
 lO3q2rt9tHfHXKyww076LFrc+EVgdddX+wS8+zAvef6lH5y1R4v353bOUdFGiLFYyQ22
 KDVehYC67TmQNM0ZIAkJfbsqnXqUGkYSc9mDQLjgt8wbd0LOrFiW8akgXFkyKrm/kkvS
 JR277pIdYjObhWoAS46XLStkD6wrTaMGMa/Z00bBzczJI9JFM3iYW7qkkbOZZwx0twko
 pzug==
X-Gm-Message-State: AOAM5322g+VKvEnZ7o310PVZC5BtkmajRL8hsrd4+mqCXH2DTE/lw9Zs
 0nlnW6un2cru3OTNHqBcLmwtq1jinPR4lhhgWlBVvigUXk0ypl/0o0rj2BKSWelb9gPc95WJ607
 mr0e41+smin4lsoAxCkYiy4QYip/jpy0=
X-Received: by 2002:a63:778c:: with SMTP id
 s134mr18959038pgc.289.1637523045665; 
 Sun, 21 Nov 2021 11:30:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIATTvQUP3+uPLWghfVp6vTzPbwsCI8jA74pXKdVixVErzqpbyUKDOTUEQCigeCbtSoSGa+IrLqQCMVTBedNI=
X-Received: by 2002:a63:778c:: with SMTP id
 s134mr18959009pgc.289.1637523045370; 
 Sun, 21 Nov 2021 11:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-3-quintela@redhat.com>
In-Reply-To: <20211119165903.18813-3-quintela@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 21 Nov 2021 23:30:34 +0400
Message-ID: <CAMxuvayk=mE-aCQrgkEXOxk+DSqCDhjkqR_sRdxwpZDdbE=ueg@mail.gmail.com>
Subject: Re: [PATCH 02/11] dump: Remove is_zero_page()
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 8:59 PM Juan Quintela <quintela@redhat.com> wrote:
>
> It just calls buffer_is_zero().  Just change the callers.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 662d0a62cd..a84d8b1598 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1293,14 +1293,6 @@ static size_t get_len_buf_out(size_t page_size, ui=
nt32_t flag_compress)
>      return 0;
>  }
>
> -/*
> - * check if the page is all 0
> - */
> -static inline bool is_zero_page(const uint8_t *buf, size_t page_size)
> -{
> -    return buffer_is_zero(buf, page_size);
> -}
> -
>  static void write_dump_pages(DumpState *s, Error **errp)
>  {
>      int ret =3D 0;
> @@ -1357,7 +1349,7 @@ static void write_dump_pages(DumpState *s, Error **=
errp)
>       */
>      while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
>          /* check zero page */
> -        if (is_zero_page(buf, s->dump_info.page_size)) {
> +        if (buffer_is_zero(buf, s->dump_info.page_size)) {
>              ret =3D write_cache(&page_desc, &pd_zero, sizeof(PageDescrip=
tor),
>                                false);
>              if (ret < 0) {
> --
> 2.33.1
>


