Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026824B6E71
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:11:45 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyYQ-0005BR-Vr
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJyTu-0002Xc-Ke
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:07:03 -0500
Received: from [2607:f8b0:4864:20::42f] (port=37734
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJyTs-0003uQ-Il
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:07:02 -0500
Received: by mail-pf1-x42f.google.com with SMTP id y5so35056306pfe.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 06:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gkFdJq2aspBQV1w/oJ8gDiBAdqA7Dm0fpgCce9GSbgE=;
 b=K7jkHttLuHQ1WaTHOXQUQyS1YS00nuaSKVRRXvOn5f7teZi2CU376P28Xzno0wcIuF
 NPx8jyXkIABV8GABFpgjhs+flm0tWj4o6QbJBzVRzpxBG+OHq2Phdr1e7GdGkuh4WCg6
 TbHAfuKJU2B7KaFJOGEs9KJqGYMNwRRqYJNdmrMg53TqOIRmPfGY99beDrJq6TMK5Ql9
 GQUve0Tm6h04b4/IHq/vPo/QeZNGs4QxDoYbopgTQTxCxsSBe6QFo1MM1lBkzD152Wz8
 EIlGvylut2TAC4m5pZxTVtKK2fKYYFb0zAx2d9SZWldoZhDeHEMv3XD1sjdEXk3NLLHm
 DuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gkFdJq2aspBQV1w/oJ8gDiBAdqA7Dm0fpgCce9GSbgE=;
 b=TcyKEcWM4lh2PCrqLznvsfGcloGJY7ZLJbhdXE7J2FOeKK909U0K3aQBnIhTW6PEVy
 i/ZSUdBIvxciV/znNfpJpYRvj+y0jNpjbtjXfON3YYCKyZkqoCJ8E627L3vZzV+6byuq
 I7xhmJa3ZP66IzGxfz2Pt0bYw4PyxUqwtfs7B7+K0NmjhQPmJPQdFldpqPiYloABsFcH
 u6dsKds/YWEjVDNHSN526rzIJlxBzI6BF0mWLm1UVMiFHERbHFf5WWykSI/KQLhj4A6S
 czPfwr6kN5DD0L4DoqnoPAAi/jveCAEy1JuslY8HFPP/bd53j8qrnrLuTzvFR75SmBtV
 awnA==
X-Gm-Message-State: AOAM532bpAVCP3u89hnmrgwzpqg5HxEh/YVjBy1Ad6Gmlh+Tj8LLl34e
 8liOM2z2zP4E6pRmoR0mcSo=
X-Google-Smtp-Source: ABdhPJx69ce8gky9kY40MNQW/EkKe+RfqWeNOhmtt67s4kbKWSABUYSMz1DPBxwRpFEK/97mO4tfPA==
X-Received: by 2002:a65:4c87:: with SMTP id m7mr3580346pgt.509.1644934018003; 
 Tue, 15 Feb 2022 06:06:58 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id f22sm41429126pfj.206.2022.02.15.06.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 06:06:57 -0800 (PST)
Message-ID: <deeb76a3-ba97-3504-3fc5-55500c25ffcb@amsat.org>
Date: Tue, 15 Feb 2022 15:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org> <5430167.XuPm0vUgvV@silver>
 <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
In-Reply-To: <CAFEAcA_58__sVrAdN410PvketwTLyyYb=OZ4y2oWDjMYGW+J0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 15/2/22 14:45, Peter Maydell wrote:
> On Tue, 15 Feb 2022 at 13:18, Christian Schoenebeck
> <qemu_oss@crudebyte.com> wrote:
>>
>> On Dienstag, 15. Februar 2022 13:06:25 CET Philippe Mathieu-Daudé via wrote:
>>> We globally ignore the 'initializer overrides' warnings in C code
>>> since commit c1556a812a ("configure: Disable (clang)
>>> initializer-overrides warnings"). Unfortunately the ${gcc_flags}
>>> variable is not propagated to Objective-C flags ($OBJCFLAGS).
>>> Instead of reworking the configure script to test all supported
>>> C flags in Objective-C and sanitize them, ignore the warning
>>> locally with the GCC diagnostic #pragma (Clang ignores it).
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---

> The warning is useful in the pure-standard-C world where there
> is no such thing as the "range initialization" syntax. In that
> case trying to initialize the same array member twice is very
> likely a bug. However, if you use range initialization then
> the pattern "initialize a range first, then override some specific
> members within it" is very common and the warning is incorrect here.
> We use and like the range-initialization syntax, and so we disable
> the -Winitializer-overrides warnings. The bug here is just that
> we are incorrectly failing to apply the warning flags we use
> for C code when we compile ObjC files.

Yes, but simply adding nowarn_flags to objc_args isn't enough, we
need to filter the flags similarly to what is done in C to avoid:

[7/373] Compiling Objective-C object libcommon.fa.p/audio_coreaudio.m.o
warning: unknown warning option '-Wold-style-declaration'; did you mean 
'-Wout-of-line-declaration'? [-Wunknown-warning-option]
warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean 
'-Wimplicit-fallthrough'? [-Wunknown-warning-option]
2 warnings generated.
[34/373] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
warning: unknown warning option '-Wold-style-declaration'; did you mean 
'-Wout-of-line-declaration'? [-Wunknown-warning-option]
warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean 
'-Wimplicit-fallthrough'? [-Wunknown-warning-option]
2 warnings generated.


