Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB44A9350
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 06:21:13 +0100 (CET)
Received: from localhost ([::1]:56022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFr20-0002lv-Md
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 00:21:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqzq-0001zf-Mc
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:18:58 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33580
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqzp-00042W-9j
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:18:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cq9-20020a17090af98900b001b8262fe2d5so5252303pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JIbUw4DYqSXVHTJ7QbQC2hGSnddwR+oTjA2Jtvag9iw=;
 b=AZXzwJKTO3TXPSdgY2M/x7/89BIvxv3g4VJ7O9xhi6gOnTGWCdrgFXbHPs04T0oPeu
 a+WmQ9nCuwpoSlzwpsmLCY6BTQBJ9GeKRUrAmAvMtDOy5tJK4DhWwql6OFDOx3s7ImPa
 rykybNNJi223SzaNGYoohfufd5SuiXPYD0FX0/DzhlgAblMPVV9qGjJEzX+x6bPloB+K
 9fiaucMPNhJPwyowD9v/Uh+rD4kLE+oat2WbWOArECAn+SnpLVBiZcj4DE4dJjeJh9XG
 PP9NtfRhxfLSs9Pk+8cA6oxvKepDYVx9Vtg6TQiwcJddW8DdW3xfLIw7sWZrNqb/OlSK
 s4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JIbUw4DYqSXVHTJ7QbQC2hGSnddwR+oTjA2Jtvag9iw=;
 b=EwnuB/5mkJtoMgrR4WKVTf33a+bIvZEELgbMgF0YKc6lAlAyFePiUZTuSZqOjh3Za/
 IdSAlKO1cfFpkz85TNHLQAXhe+u4NT80KVztpJ1XS1wLhYYEpOokZQIviY3T5FENPeJU
 7864WQsvyzZYW4hedrlt/3PibYIDHhoJVFrSmxuEUrJYlsx8qsZBOKtqeXD7JJ7cL+6N
 dDvGQG4PyrFeBsn9dejRtBOf67TVCHICjhr+9OwbqIq9jHBEn2hGWByYE/8FI+F1I56l
 Hv8HDadoGMn5ric5ZpiYk4igrtuyVfYTu/i6Bt29J7OuasgPBVjkWnvk7BKVeRtZ8lbe
 tDow==
X-Gm-Message-State: AOAM533Tb7yoGhZxLf/PzXoEpdi7t/8nSDzR/XGKJ1iL2c2vTgbbPxiC
 m+ASbgjwodPsGb0F4ba2LuQ=
X-Google-Smtp-Source: ABdhPJy3di25O6fEpl4rRTxjNu2a2LuxVcGLXC0V74Cdw3lrTF+4vYcKFFNlXpvll67i1IjP6axrEA==
X-Received: by 2002:a17:902:9a42:: with SMTP id
 x2mr1408595plv.58.1643951935702; 
 Thu, 03 Feb 2022 21:18:55 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nu7sm718664pjb.30.2022.02.03.21.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 21:18:55 -0800 (PST)
Message-ID: <bc307f02-4d10-5136-dd05-d8257e25a52c@amsat.org>
Date: Fri, 4 Feb 2022 06:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 24/27] qga/vss-win32: require widl/midl, remove pre-built
 TLB file
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-25-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-25-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/2/22 18:33, Paolo Bonzini wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> There are no good reason anymore to keep a pre-built file in the repository.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build               |   4 ++++
>   qga/meson.build           |   2 ++
>   qga/vss-win32/meson.build |   9 +--------
>   qga/vss-win32/qga-vss.tlb | Bin 1528 -> 0 bytes
>   4 files changed, 7 insertions(+), 8 deletions(-)
>   delete mode 100644 qga/vss-win32/qga-vss.tlb

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

