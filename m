Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2073A82EF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:33:07 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltA7m-0005lo-90
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lt9fd-0007mB-Vw
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:04:05 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lt9fc-0000fE-20
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:04:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r9so18495898wrz.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vbw3S4X/nBMjSMcxdLL06rMsYFuswGnhgwpVpTTa4EQ=;
 b=SKon1E0Pagyytwt55aznzdXlMIshHhktOqarNtDf8NqelFWfqw65VHePR7bAbbb62Y
 JMSFQsoZhcAVXac5fx1wiQAP+ryJxBDqINPM9wiS0Tc7tTAX8LLOotIiGMTjz/TDHlBr
 0d8DhJ4o8Nj2zDJ21QCip0iWchYbBQLo5tNE/n4IbziFct9eGE3LBU80M/y3FWwukrko
 S4SqesoFtZ3/2E47IppsrNEkAPQz1n/ipnz8T+jv9S9YdGB+qjOVSwhVFuZzDoKTvekk
 iJ+IPrFoCMAcmqqS9eOTaCPUBnDtLFX8Hq02X/uSqPWJ+2mh1WRl0VeHMENpSJeg5BIO
 xnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vbw3S4X/nBMjSMcxdLL06rMsYFuswGnhgwpVpTTa4EQ=;
 b=fUfF5IkzTMDnEGKjwagbRdsgzeuhnWzYyTclDmXOWCSmRUv1sXCfFQHwwgOi6yN+MC
 oxhgpjPj+M4iZbgZkqEKAWdl3MY0efV+HjKVsism+M8WZ3zwT7++j/JMmpRK1bdnth31
 amg7h1Dqj8IS6/tgVb9EvJIgHNhB+dJu4xdC8kct1y0fEWQ2XPP14mr3/qjAn+2CqxWB
 ds5Ngh1WAbPlJXezWtlqrI1jkA4vA61UqhvLSvLkXS9a1c0O3KDc9VTukEaAHzgSn7BJ
 lvHSIqLzJxrokgm+WWKy4rcdQDRvysUeZ5ey+HDFaJk2T8HxQypYKr1f775KFjrohJY6
 Gfeg==
X-Gm-Message-State: AOAM531pLO/FAB7McuTZ05xblpIGp2JtansOcNPhgFk1xE0hWQIhuKXH
 RbWRLKN7L5ZLsOKL45wijmo=
X-Google-Smtp-Source: ABdhPJyc4TFMJdoJC4oz+CT7ZoEXWcDTbwP7NEpthTvqdAYPvLfPcfdrkPuVsqOa/1iwfFsq1h6KRw==
X-Received: by 2002:adf:db4d:: with SMTP id f13mr25640186wrj.243.1623765837196; 
 Tue, 15 Jun 2021 07:03:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l4sm6609278wru.41.2021.06.15.07.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:03:56 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <50c71eb7-02ba-a7a9-9ed3-a1908cc832e7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc007943-ffcc-1e14-aee6-ee6e4d43280c@amsat.org>
Date: Tue, 15 Jun 2021 16:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <50c71eb7-02ba-a7a9-9ed3-a1908cc832e7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 10:56 AM, Thomas Huth wrote:
> On 14/06/2021 19.32, John Snow wrote:
> [...]
>> RTH raises the issue of the "TCI" subsystem of TCG, which is not a
>> full accelerator in its own right, but (I think) a special case of
>> TCG. If I keep the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is
>> inappropriate.
>>
>> Some suggestions:
>> - "TCI" by itself, simple enough.
>> - "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up
>> in label search when you search for 'tcg'.
>> - "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.
> 
> I wonder whether we need a label for TCI at all... I can't recall having
> ever seen a bug ticket filed for TCI. It's quite a special use-case with
> some few users only, so it's maybe not worth the effort to create a
> separate label for this... just my 0.02 €.
> 
>> We probably want to keep a set of labels that apply to the host
>> architecture. These are useful for build failures, environment setup
>> issues, or just documenting the exact environment on which an issue
>> was observed.
>>
>> We won't likely require the full set of targets to be duplicated for
>> this purpose: possibly just the most common ones. I assume those are:
>>
>> arm, i386, ppc, s390x
>>
>> How should we tag those? "host-arch: XXX"?
> 
> "host-arch" sounds fine to me. I think you can limit the selection here
> to the list of TCG backends that we support:
> 
>  arm, i386, mips, ppc, riscv, s390x, sparc
> 
> ... and maybe tci here (i.e. "host-arch: tci")?

Great idea!

