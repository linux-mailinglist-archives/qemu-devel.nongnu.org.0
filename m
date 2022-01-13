Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92A48DCE3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:25:59 +0100 (CET)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83rK-0001pk-Iv
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:25:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n83eu-0004ee-5b
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:13:08 -0500
Received: from [2a00:1450:4864:20::52c] (port=41901
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n83er-0007ck-Mr
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:13:07 -0500
Received: by mail-ed1-x52c.google.com with SMTP id t24so25544596edi.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/AY0CTtWvxELdQFWSRD/xT63q9bRhMylJ81/3F6tnhk=;
 b=VK/H5ni1cIycgfg1U7RcwqFcHuJjUY6XmP3kyWAsgjzJbrQHkPXM5Xjr3H3VdP14Mw
 KTBIxmk7eRYa6rs3sETYvMBq+FOWpeu7ehGgnGxJuQmx2vvnd6kgiqPHRbgzDSXxiV7s
 jpFlMti56XxYVoG+WxGzt+RwRcy/Bx25UueWWgWt2k28ZspZ2UsMrUfmRpLWk2SOFuJU
 ib8BEuS39cjcVN/l4Nw4oFTxyhyi09LMPEOyuPKNlNTB19UtMg+gYYLyZLbSH9i558H+
 oV0vvr3CEC5VRxjGei0vBVEdB4CVdId26na4GnDx+RO5YVhp+CYkeR061k41w3lgBKpq
 RSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/AY0CTtWvxELdQFWSRD/xT63q9bRhMylJ81/3F6tnhk=;
 b=5rHaXQwGrW/3f4kTz4/0wLlclqEMujLsPPXZih7w6FNW/Q+CsIBkagfrDQwAPEiOZ7
 fTLRUG67TaMhwaKHR2w67GLiqnasQQ0CICJYUNxEJecDR2JAJ57AvsydNsXejryc2LmK
 yxoDuQO7nI9Xo+2YxY2jSepOZ23EFUqKpJVpiVzQlB9UWjso6az38vZU30bRbu/cB6qs
 KLwoDxVbgAzfrTPOZCxXvin5vSAZHpcKcJ1hDL6/vFJ0oIynnRU5aikv/dG5VJqz0WBi
 TLK+s8mOv/2TLDJZCRMOUs9pTTRZH/3mVV250MX7y1JPznPsQwHHHQcyioqEFq9bPFhs
 ym3Q==
X-Gm-Message-State: AOAM533nstqCN8gOSlWBWHaXfifYU50rB1fPNEt6f1bGszXBi23HUy6N
 LqGCl74/bBPZ1SlNyoibE48=
X-Google-Smtp-Source: ABdhPJy2GxlteBaNenxfeQf6QcSQWac5pEizSkwOJ1GA4WYfegCwMW2Dd6XMRw9mTL9Oy7aCWgQ37A==
X-Received: by 2002:a17:907:9692:: with SMTP id
 hd18mr4544655ejc.267.1642093983381; 
 Thu, 13 Jan 2022 09:13:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id p4sm1049672eju.98.2022.01.13.09.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:13:03 -0800 (PST)
Message-ID: <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
Date: Thu, 13 Jan 2022 18:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: /usr/shared/qemu binaries
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Liviu Ionescu <ilg@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 14:56, Peter Maydell wrote:
> Those are UEFI firmware images which are suitable for using with
> the arm/aarch64 "virt" board. They're only used if the user specifically
> asks to use them on the command line (eg with
> "-drive if=pflash,format=raw,file=pc-bios/edk2-aarch64-code.fd" or
> similar).

There must be lots of zeros in there. Maybe we should tell QEMU to 
unpack firmware .gz or .lzo files?

Paolo

