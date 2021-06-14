Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7D3A5C89
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:46:36 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsfQi-00072V-0r
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfPW-0006Gv-C0
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:45:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsfPU-0001dR-Qq
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:45:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m18so13064170wrv.2
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pbfpofk9DYIY0BvfA37cYOahedIiNxie7yLbD2SHNNc=;
 b=GEXKj7sFDSfrLhouifPUoP4Iwd2khNfkKqIgjPo6h2vVdVza3OdrM5J0Y2n0eIdLXW
 o+J53wwNtwTYGn3VP2xLRpcWoPnxRrDQGiHV6eAfqYbgAxjd12zvTFFjOnBEvMlJI9Ab
 F4N8G/sefvcPDLEx3qSjgxEngEzdj0xKiJM0ZvI+YUNmXD1VNzVjM3B7zXMl8PiYPPby
 /8G+4+CyRWidZ9QrQIHf88nB0T8C2hXe5Vz6nuPriS6uYYFztPbj3TXtUG+Yds3YD0HT
 DW41JwYRwG64X7zwFAsQ2Lv64Zn/XcfM3rTcYShpTIKVhMWVpg9L7X76/ezYQbt+cd3c
 cOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pbfpofk9DYIY0BvfA37cYOahedIiNxie7yLbD2SHNNc=;
 b=SD5aEz+/aRuo8h/ikLp5i4O/MiOcdfQNuLt6N71fqvV5nguf0/eh8pGZpHMm5db7Kt
 a4cFzgy4Ar/qRCvrFTEC23pEHodEd8jRAOon4FVFyNR1j8qbISDDgbJehONAzN5/Ko7m
 ubQtpFfjfYRdhK/DMAXEqmXni7PGaNU1dyWUQzAeAgAWGV68ffQXzazCT0rU/9z/e6SR
 CJm/+tIB1xP7RcmpMZR3BXu1VTcKnvyiyDk7+I7uIYH6kLjfsd76CjbBLQrkAiyzG2Wo
 4dC/ZQ35Qpri0bLYA0+mEQnHMIIOvX93wj7SzCLRqS919eKbAgMw0sV5ha8wCSXs9cs2
 CIMQ==
X-Gm-Message-State: AOAM530dRV7uBu3EaAfeYa2xG1qTnXXE3QPGirErNb28neJAzNTjmvwS
 5wQSs3FBK6X1h93HcXdUQbM=
X-Google-Smtp-Source: ABdhPJzci+p7o/W++dF+09YSWzVtlyt7l+seRwce0ncgB54kJ5eRKFG6nLVM+jIaqwiR/2k+3gVUGg==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr16456456wrr.265.1623649519372; 
 Sun, 13 Jun 2021 22:45:19 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 62sm16180998wrm.1.2021.06.13.22.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 22:45:18 -0700 (PDT)
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
To: Stefan Weil <sw@weilnetz.de>, Brad Smith <brad@comstyle.com>,
 qemu-devel@nongnu.org
References: <20210612080358.61176-1-sw@weilnetz.de>
 <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
 <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff5fc830-8df8-7bd6-32df-3e8627edd74b@amsat.org>
Date: Mon, 14 Jun 2021 07:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/21 8:33 AM, Stefan Weil wrote:
> Am 13.06.21 um 03:40 schrieb Brad Smith:
> 
>> This same problem also applies to OpenBSD as we have the same
>> version of ncurses with support for wide characters. I have a similar
>> patch in our QEMU port.
> 
> 
> Then we should either extend the conditional statement to handle OpenBSD
> as well, or simply define both macros unconditionally:
> 
>     # Newer versions of curses use NCURSES_WIDECHAR.
>     # Older versions (e. g. on MacOS, OpenBSD) still require
> _XOPEN_SOURCE_EXTENDED.
>     curses_compile_args = ['-DNCURSES_WIDECHAR=1',
> '-D_XOPEN_SOURCE_EXTENDED=1']
> 
> Defining only _XOPEN_SOURCE_EXTENDED would also work with old and new
> versions, so that's another option.

It is simpler to ask Brad to upstream the OpenBSD patch :)

