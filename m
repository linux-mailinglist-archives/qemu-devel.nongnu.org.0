Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA05B4871E3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:52:00 +0100 (CET)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5hEN-00055F-VD
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:51:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h9R-0001GE-Cr
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5h9E-00022W-PI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641530798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/OJQRlvXPny9DOOenFvbs7x/rl51iZpQkOJgsROINJs=;
 b=Il31IZTsJWKu0nFQY1MOD7xoM1KqZ+210nAyLvAOKaskHKdVxxMYuJK5ImqqQZabRC4nbn
 GKnl9+SndCKADt0qdA9F/mRj49QvSjeq6MTXOitoy+vA472Km3ft+LIzu47BKzpUAM9SOo
 7IGNtXy+4OtuhbmNveSLmW5LxrFjwkw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-oQDKZsYpP8CjF27Q6Mirpw-1; Thu, 06 Jan 2022 23:46:32 -0500
X-MC-Unique: oQDKZsYpP8CjF27Q6Mirpw-1
Received: by mail-lf1-f71.google.com with SMTP id
 g2-20020a19e042000000b00425cfac0e67so1489814lfj.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/OJQRlvXPny9DOOenFvbs7x/rl51iZpQkOJgsROINJs=;
 b=h/KEQFGryUeQ5R4IcLDs3F/ogN2CPYx0x1KE+vzPyfSDDrQ/GPZqo9HUcpDEaNTbK7
 +UZohBJ0cPVG7mMUQqbFRbxu3gLq3VwtkCacL1j1S6BHZgemG4xc+9Oj4OePRHayNCu8
 QN5XxiLpmevBAUZQvPJ0k4oeQLxTXl16Nf7q4zewmM0yGnht4krF19dw88w9q9YqHbDJ
 H2f0lq7c3IQe75k9HJhr1+D5OGsRiVhKnBpLGTTFMwYRhdk8e1Ck/pUcmtYY0g9Jjevc
 cWokHoFnhWJqXnaUtFpQl4fnvej7wHy51vbu7avzaEQ+2eTT51VMZf6jccflN3gTgvXy
 TtSQ==
X-Gm-Message-State: AOAM533Ee2Hx0grdi2L0tmcM+58Rbo4N2+QlXigguW2nAsh7HoEZM678
 X4IWdnHUCStebi7ydapB8mDMSbQGPTQLt68fCI2BspHXa0wH7I+04FZvtLstMaXfYRsIrL8OVDo
 CVfMvfrUIWwVHXyV3+UC5e8oNK5SCs44=
X-Received: by 2002:a2e:9183:: with SMTP id f3mr49577731ljg.277.1641530790833; 
 Thu, 06 Jan 2022 20:46:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaMInlKDhKDE2OTWkXVAzpDLCEkFwcEKnnuKHim+Ftk7TtNJ7OvoAh4nYu7Z/pOXrKrkDx7yCNRB5HALkAZfQ=
X-Received: by 2002:a2e:9183:: with SMTP id f3mr49577726ljg.277.1641530790687; 
 Thu, 06 Jan 2022 20:46:30 -0800 (PST)
MIME-Version: 1.0
References: <20211220010603.1443843-1-chen.zhang@intel.com>
 <20211220010603.1443843-2-chen.zhang@intel.com>
In-Reply-To: <20211220010603.1443843-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 7 Jan 2022 12:46:19 +0800
Message-ID: <CACGkMEvvqQ4wQ2ZdaEu-Ji=-=meWj=DPwr3yrgfTeepo_36GBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] net/colo-compare.c: Update the default value comments
To: Zhang Chen <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 9:17 AM Zhang Chen <chen.zhang@intel.com> wrote:
>
> Make the comments consistent with the REGULAR_PACKET_CHECK_MS.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Applied.

Thanks

> ---
>  net/colo-compare.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 216de5a12b..62554b5b3c 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1267,7 +1267,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
>      }
>
>      if (!s->expired_scan_cycle) {
> -        /* Set default value to 3000 MS */
> +        /* Set default value to 1000 MS */
>          s->expired_scan_cycle = REGULAR_PACKET_CHECK_MS;
>      }
>
> --
> 2.25.1
>


