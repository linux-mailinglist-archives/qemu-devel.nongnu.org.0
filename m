Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF043A78A5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 10:00:23 +0200 (CEST)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3zi-00027v-P9
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 04:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3y7-00086T-Tu
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3y4-0006FE-4e
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/ARokOz73QriOjzNHgx550iPVoNYqdxkBwJ43Nj8bs=;
 b=O5qSGXh4oXh/CA+XgVjStO67zP2uJhb2eIftzmPVGCd0oNIOP7BTk19W/WWi1AITSl3k6a
 ZOCjZ4g5dSk9t7RObI96LzJu0eVX7pb21d8m2UjUwx95fNBLmbK3uOCdyv+ElUHe87BPiQ
 63V3fuxlNbLsqojr2NpuyN30Jn/nKf0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-G05809CVPB-DHaPpx8F8Dw-1; Tue, 15 Jun 2021 03:58:38 -0400
X-MC-Unique: G05809CVPB-DHaPpx8F8Dw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so8253872wrc.16
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/ARokOz73QriOjzNHgx550iPVoNYqdxkBwJ43Nj8bs=;
 b=kWJS6VW/uA4sT7TSloG2MTCjP2v/5JPogCnWtXMNr5ccnm5/I4Q2sIuffKjxn4MsoL
 pp+8/mRkf54ktOLlxaSrWifZpVo++tLWjeKIeGU3SEuDlbfZ/7W2P3qnDxpDJN4YYh25
 MgI9q2y802z94cgB2oBdzPpwnvJkhLt7WLZLKC7QG7MMNWNuqVeyFhja9oa/G7frwUjc
 bNxnTu76S5tDI9T312G52UO9zETRBXoq4TZce4LqbW4hpUZhd/JhvqS8Laimx2PQGgXa
 ZdnJ+Yi4ipkjfQWhdnumPaSVSgrDHs6O40Rujh1NXxGV2d9nJXBKCZezwqPYJnk/okTe
 xCCw==
X-Gm-Message-State: AOAM533dwPV9iXkGueKzS191upzqznZXwoaxZt/FAH4hPzFMeCVKCukp
 cKH/obkXlOjdm6yn5FFToa8SQzoKnf8qdYVyeXajJ6u2ZnAJHwjhEztwL7QS73nYo78xeIazn69
 vQjtSndCS1oD1g6Y=
X-Received: by 2002:a1c:8083:: with SMTP id b125mr2850213wmd.176.1623743915821; 
 Tue, 15 Jun 2021 00:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXCrD0vXXD4b6xxUL3ROd/N4DrWs8fqH4cv008iNJJOiqSm2YEOPaznh+zsOf77EoKftwaWw==
X-Received: by 2002:a1c:8083:: with SMTP id b125mr2850197wmd.176.1623743915651; 
 Tue, 15 Jun 2021 00:58:35 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id w13sm19686150wrc.31.2021.06.15.00.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:58:35 -0700 (PDT)
Subject: Re: [PATCH v2 8/8] configure: Remove probe for _Static_assert
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-9-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <102db642-5006-9362-f400-e138402f27eb@redhat.com>
Date: Tue, 15 Jun 2021 09:58:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-9-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 01.31, Richard Henderson wrote:
> _Static_assert is part of C11, which is now required.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure               | 18 ------------------
>   include/qemu/compiler.h | 11 -----------
>   2 files changed, 29 deletions(-)
> 
> diff --git a/configure b/configure
> index 0489864667..debd50c085 100755
> --- a/configure
> +++ b/configure
> @@ -5090,20 +5090,6 @@ if compile_prog "" "" ; then
>       have_sysmacros=yes
>   fi
>   
> -##########################################
> -# check for _Static_assert()
> -
> -have_static_assert=no
> -cat > $TMPC << EOF
> -_Static_assert(1, "success");
> -int main(void) {
> -    return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    have_static_assert=yes
> -fi
> -
>   ##########################################
>   # check for utmpx.h, it is missing e.g. on OpenBSD
>   
> @@ -6035,10 +6021,6 @@ if test "$have_sysmacros" = "yes" ; then
>     echo "CONFIG_SYSMACROS=y" >> $config_host_mak
>   fi
>   
> -if test "$have_static_assert" = "yes" ; then
> -  echo "CONFIG_STATIC_ASSERT=y" >> $config_host_mak
> -fi
> -
>   if test "$have_utmpx" = "yes" ; then
>     echo "HAVE_UTMPX=y" >> $config_host_mak
>   fi
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 5766d61589..3baa5e3790 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -72,18 +72,7 @@
>           int:(x) ? -1 : 1; \
>       }
>   
> -/* QEMU_BUILD_BUG_MSG() emits the message given if _Static_assert is
> - * supported; otherwise, it will be omitted from the compiler error
> - * message (but as it remains present in the source code, it can still
> - * be useful when debugging). */
> -#if defined(CONFIG_STATIC_ASSERT)
>   #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
> -#elif defined(__COUNTER__)
> -#define QEMU_BUILD_BUG_MSG(x, msg) typedef QEMU_BUILD_BUG_ON_STRUCT(x) \
> -    glue(qemu_build_bug_on__, __COUNTER__) __attribute__((unused))
> -#else
> -#define QEMU_BUILD_BUG_MSG(x, msg)
> -#endif
>   
>   #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)

Reviewed-by: Thomas Huth <thuth@redhat.com>


