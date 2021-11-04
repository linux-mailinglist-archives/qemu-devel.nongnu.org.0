Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1683E445C10
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 23:18:57 +0100 (CET)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mil4R-0001Is-MV
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 18:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mikzm-0001kA-GR
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:14:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mikzk-0005cg-JD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 18:14:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso8278436wmd.4
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 15:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E28/S2GUIZIHfEDC7d3aM00DHHzMSzrwwnBL93IPGeI=;
 b=RB3olpw0DxTvIgeyBl3MV/E9/ZVAdQ9HUIAnbvF2rSBoqjnJv5AO9M+avWd7vfhaeK
 6+i+9n07Oq1jdNM35ZztwwxED0TSwTxMiIXcYQwEI9R8/EtWGFI3cjf7Io6xtsxq+8AG
 5l5a0fGkTEyOmTWFKDpqvn2UOfwvvqqF+8LmQNVf7/UNYuLyRr/f8QhbHbUbT2MjF3su
 JPNdGxBWK6yIL6OJytFlhJj08gwvOnmznxzCtjR63uCh3fOVd3oJ9CgxvjicHxnuSL2/
 A17u7MTSfrQmtfO8oDPBojJR/81v0HCuDo6EQp+rG9gaFdm6jmGWwXmD0B/YzXYnbWqV
 h3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E28/S2GUIZIHfEDC7d3aM00DHHzMSzrwwnBL93IPGeI=;
 b=bXqqdfnQYRlxXFOQ5BK7GQqpGBZAMq5hYdoZALAmyVli0slNqwh1vg/O6HGOL6pwuu
 27/EVeMT2FlNRmkGqH3UEyTgpQyAlTcjNf90XtCERfHI/KtH3EMzURfN58ZticjnempP
 PGrVMVBQJjGFnxEeS6Q4t26dhfvu+hcS1s9S6u10cygazcAT1Itd1h0pR+zhz/0Vgr+2
 BRQgcwClz5GdZxdgBZwu5l+rflNlY1PEHj7A0up64/KOSsNk7HqlnznaqmL0JCJbVuxi
 8Ttwn231INApGN7Iaohwb5qUnQPe5Ga3EC+PSYQDA8p90uT847DYkFTzrMZ6Q8vgOH9p
 Wx5w==
X-Gm-Message-State: AOAM533hMBEywFuCzYXigHNGsko/GEdip2qxnhpP7S59fnqmQ/JlpVoQ
 xxVJKC00ozPMwZeoGG15mCI=
X-Google-Smtp-Source: ABdhPJzUsygqemlxWwvQCnMxFD7WzVgQ2t5Wyas2Vxd+O4v3BHWXp0l2SUvkKBM69WqVF3HoycTkiA==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr25709128wmg.58.1636064042584; 
 Thu, 04 Nov 2021 15:14:02 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r15sm6463696wru.9.2021.11.04.15.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 15:14:01 -0700 (PDT)
Message-ID: <65f6b699-8db4-f216-d18b-6621cb79e82b@amsat.org>
Date: Thu, 4 Nov 2021 23:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211103203146.3630550-1-f4bug@amsat.org>
 <YYOirmDXpPq16ZMi@redhat.com>
 <891bd73d-771a-1463-ff2d-5885a6081cd4@amsat.org>
 <SN4PR0201MB880896CEC8C3B4F706E2F80BDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <SN4PR0201MB880896CEC8C3B4F706E2F80BDE8D9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 16:17, Taylor Simpson wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
>> Behalf Of Philippe Mathieu-Daudé
>> Sent: Thursday, November 4, 2021 5:02 AM
>> To: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Taylor Simpson <tsimpson@quicinc.com>; Richard Henderson
>> <richard.henderson@linaro.org>; qemu-devel@nongnu.org; Laurent Vivier
>> <laurent@vivier.eu>
>> Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
>>
>> On 11/4/21 10:06, Daniel P. Berrangé wrote:
>>>
>>> When you say  "manually add", can you confirm that you explicitly
>>> inspected every license header yourself to validate that the reported
>>> match truely is GPL-2.0+, before adding the SPDX tag.
>>>
>>> Adding licenses tags based merely on a 60% match, without doing human
>>> inspection would be questionable.
>>
>> Yes I explicitly inspected every license error before manually add the tag, but
>> I am human, so prone to errors, which is why peer review is important :)
> 
> This seems like more of a question for a lawyer to review than technical reviewers.
> 
> I remember discussing this when I made the initial submission.  At that time, there wasn't a broad policy on this.  Has that changed?

On the policy side, nothing changed.

In an earlier version I posted I was replacing the license text by the
equivalent SPDX tag, but I've been told I can not *remove* a license
text without an Ack from all the contributors who modified a file;
however simply *adding* (although duplicating the information) would
be OK.
This is what I'm doing here (what 'technically' changed from earlier
patch).

