Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD7A6E47DD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poO4C-0001k2-0p; Mon, 17 Apr 2023 08:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO3v-0001dJ-Tg
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:34:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poO3u-0006sx-Ac
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:34:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso4533215e9.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681734864; x=1684326864;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jQnz3n1AuRPtCJ1RDVocHpGppB0g/9zbL7gA6j6iNsk=;
 b=jWNACl3Mv8T6RnJ2Tyq1dQTW62FBIGpJNCFkGblaSI2JAcJIVilFP/umFBmbz1w/HH
 r3Nmyfh9lWQRsSoP+uPNvKi9OFgAt4pviDH/9aYuInFEjFUDPs4xscK54uNmOE9AXi5w
 9u/hB0RyE74A/MZBcWu4fP9d8+DYXZHoV8NTHsmSKOVl7QDmMl7s4wrHFkPrl98mUJlB
 IESEaRiefya3Gtgm95mePAcnbg+X88s8w4Dui87ZvlYm4+Mdh314bGeVGm8OhRs0Gp0b
 wlgDQP/Kj08xv57wSi2pHaqfOjNq8JH8BZk2hKcMdmJIcH1FfwHAd14uFUdUethfcmRY
 miyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734864; x=1684326864;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jQnz3n1AuRPtCJ1RDVocHpGppB0g/9zbL7gA6j6iNsk=;
 b=ZfxfBBSwc3RMjmz70OwBHmJJB+yv2m8Z3W0xzppbr/1fjm6D1RXjP4x2jCJ4QsWsKR
 O65Aj7Z5y0+069zBuXofovjAiy+l2+qlC575wEhnvNgD0wwjPGrRMGkZrCGeWYaEeMvm
 VEUgJ+o8nViXJAYDEHNJlS4ZmQ3tjalNK/9KkttlGiXaY87p6hncHQFK6Qx8zX8gfpX4
 p5EbJg97qPIPLEh/bYllXPFhkCLuZSSfLzjXJIv5H4ulKamNeuxJ/qI1BkBjM267jcJv
 Bx87FJiJ6LI0DiT7/plauDJDFZvqZaE5YswhmtLbbNP+OtDN8IThIWMXv3WnUQL1o9jO
 17CQ==
X-Gm-Message-State: AAQBX9ee0cLsAtvL5dfD25Ei5gl1ZMeclPgbuRmYE+J2JxdxGKtiuA8l
 AWbSSltM3xTtIA3rAVFQ1Fs=
X-Google-Smtp-Source: AKy350ZMoM7ssfA8tZqdPzobXT3XgXokj5MKZKhf3HYCvcgZjxuGt3q+5Ae24ff7S2+r47tuGPVhlg==
X-Received: by 2002:a5d:5409:0:b0:2f8:5d73:dbf0 with SMTP id
 g9-20020a5d5409000000b002f85d73dbf0mr5397935wrv.27.1681734864568; 
 Mon, 17 Apr 2023 05:34:24 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adffa8c000000b002d322b9a7f5sm10452463wrr.88.2023.04.17.05.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:34:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <eea29aa3-b3e7-6579-aef4-74f496e99c66@xen.org>
Date: Mon, 17 Apr 2023 13:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5/5] hw/xen: Fix broken check for invalid state in
 xs_be_open()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity points out that if (!s && !s->impl) isn't really what we intended
> to do here. CID 1508131.
> 
> Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


