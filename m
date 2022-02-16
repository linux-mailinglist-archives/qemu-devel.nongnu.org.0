Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F8A4B8F23
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:31:24 +0100 (CET)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKO9D-0000us-EI
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:31:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKNuj-0001i0-GQ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:16:25 -0500
Received: from [2607:f8b0:4864:20::630] (port=41838
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKNua-0002tT-Ev
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:16:18 -0500
Received: by mail-pl1-x630.google.com with SMTP id j4so2480122plj.8
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=soeRtaHMpVlIOG7bBLcFT1ESX8NximIrsneRSnqTvL8=;
 b=g0/dezJBg0NxiANRE/x5imbaFxvG+AHQ0yC3cZpn/Q8TYbCdGlhkHPxuop/+AQ9QTU
 z6HhW3Uyq40SlQGkFeBvI3H36fHVlQLOdGmvgl62pPseoGWw1V+pePJL0pSQ5dXxLcA+
 nK67lOtiM9dm/KIBDjiAgzK5dJCNwh9AMJGtiLXkYr/kCIOSQ06BZlCnmvgmhieRiaca
 IDsLatE7iAyBphhbD33+vP7y1xFl94WGDTl6ro72sNSIs+j0RJqwrjx0mvk+lJswHFbK
 wRErjty7POF35iFon3oXHve5Zj8miYP+YIoT7jkJrCV6vU2oK8MSFlzIVSn4dHht+cZc
 rvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=soeRtaHMpVlIOG7bBLcFT1ESX8NximIrsneRSnqTvL8=;
 b=2kL/VsCZLO4e07RJ0L+QCSeALkLQ/jgMuL7ZC/gFYuzTlBFM6aIyywH31luzHxDn57
 J1NBUIVm0CAF8bQvRGKnA0TkCBW3vKMHDw+D0efXEwwEC6Tz+W5ngsKBcYzDdAfZHI0j
 SawTuGOFpuVy+fB77CH2ToZSlZ8Zn/bQGBwJgt/N2ercoHIOnQNwXqcDP2bzyTH9YlOA
 NYQ3oLaSHpjLWCo2EK+yTQN6fCVuPK+7MasMC6bvjRMvpg9pZWdbrBlK8K9cn/ijDhSn
 CCsYUEpxGshlytxpMFWqXw+JH8B7N43SJOE0O8MYe9shM4zhwZxAosmRH/+4lrkM5IC7
 cEaw==
X-Gm-Message-State: AOAM531kx8N+mSEYexuzPsSRkEE+ebEj6BrPnxZcwEZqy4KKlB5Mvcbz
 tdHdNHOWXxWOIcT85C0+9Og=
X-Google-Smtp-Source: ABdhPJxyaIfFOH8zIED4LHEZioJ4JrxjSUopKBd1YqFRr49vAXUL27NzX5z1k5s4gIP8Heoj/NYB5w==
X-Received: by 2002:a17:902:ab18:b0:14f:3c15:8f18 with SMTP id
 ik24-20020a170902ab1800b0014f3c158f18mr3785716plb.21.1645031775011; 
 Wed, 16 Feb 2022 09:16:15 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id y72sm14092334pfb.91.2022.02.16.09.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:16:14 -0800 (PST)
Message-ID: <ea30ad98-8e15-7404-c91c-ec475551b866@amsat.org>
Date: Wed, 16 Feb 2022 18:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: QEMU's Haiku CI image
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Richard Zak <richard.j.zak@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
References: <c13291ec-ed73-a62d-24bc-e4282aad2031@redhat.com>
 <777cb005f1c2197ff3fd610f89215b4d@unixzen.com>
 <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
In-Reply-To: <0a36d4b2-965d-84ad-1e04-ab4cd8c437f1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

On 16/2/22 17:32, Thomas Huth wrote:
> On 16/02/2022 16.52, Alexander von Gluck IV wrote:
>> February 16, 2022 6:31 AM, "Thomas Huth" <thuth@redhat.com> wrote:
>>>
>>> while researching the different "sed" options on our supported build 
>>> platform today, I started
>>> "make vm-build-haiku.x86_64" in my QEMU build directory for the first 
>>> time since many months again.
>>> And I had to discover that this is completely out of date. The image 
>>> does not contain any version
>>> of Python 3 yet which we require for compilation since more than a 
>>> year now already, and the Haiku
>>> version in there seems to be too old to do a "pkgman install -y 
>>> python3" ... so this has been
>>> completely been bitrotting since more than a year now. Is anybody 
>>> still interested in keeping the
>>> Haiku support in QEMU? If so, please help to get the VM image 
>>> updated. Thanks!
>>
>> I submitted
>> https://patchwork.kernel.org/project/qemu-devel/patch/20220216154208.2985103-1-kallisti5@unixzen.com/ 
>>
>> to fix this issue.  The build runs as expected after that patchset.
>>
>> Likely cause is us no longer packing a "python" binary, deferring to 
>> "python2" vs "python3"
>>
>> I'm still the most likely maintainer.  Are there still plans to 
>> automate the tests for Haiku to
>> prevent this from happening again in the future?
> 
> AFAIK we still don't have a machine where we could properly run VM-based 
> tests in the CI, do we? Peter? Cleber?

We still have unused fosshost.org resources. What we don't have is a
sysadmin willing to install the VM and maintain it over time.

