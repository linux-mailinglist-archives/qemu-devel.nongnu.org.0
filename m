Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEE37FDC3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 21:03:10 +0200 (CEST)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhGc1-0005Th-CA
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 15:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhGaD-0004HL-0c
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:01:17 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhGaB-0007lM-Dz
 for qemu-devel@nongnu.org; Thu, 13 May 2021 15:01:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id u21so41261516ejo.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e/Oz23jS3tOnZNaGIlywjP8nRYFTPTPg/5U4T22hO0k=;
 b=qODyhuiiuqjw/VRTnFNk5LeHxX61b3iIrphhsg8f/U2r/YvTtmeBRf9yiwnMMtsVRu
 9rFP+utbgfje5Kr4V0NSWob5uB7yGnsarfRQVEQaYqDBGLrf2SLn3iENKpBzCQsSvLX/
 yauAJrcVnDlLseWUeyytC64iOM3GtDeJQEjCN7KHHVgnmPMyhxzDPfuwfvCycdefiz6H
 pDK+srvlipbeq5ZhN03ynAIdDiFsh38u316nYYJYybLwR7FEedPCOOSHNj7CWja0qODC
 1KFKnnT+i2An28RyIfc/4eq5JUCxL1Inqy1lP4AJdiCa2VW5ZsHjGMtpaWnaOkaUqKaS
 qGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e/Oz23jS3tOnZNaGIlywjP8nRYFTPTPg/5U4T22hO0k=;
 b=hz5H2kWtZgepX+5PCDa+tQVGahwvtNBnqylbvsG7SlEB7h6FzACIz2qGJr5oy/eMpL
 HHvZRRlZavbJjbjR1yUgZxEQPpWyFWc5q+dhndWpezTBXOn8wltifxIktEzyBF0TNhAn
 yLiiopR7lFLZhgDEubmaHTBeJbZzg96ZweLSVYxIB+15grxGQMji2zunPoz3PPBnAseO
 kUQEmeKr8Z1v0JK3A3RThinWRIMSKKnqds4eZa47Ymxhv32pILra0y0TF3u+nGl4oEn5
 KWU0aJpmikQCzRG6OSSiHb8uM3cVGUVHb51CRSKvZ5CagFdtfXuAsH6O3AkGHbq1XtEC
 FsUw==
X-Gm-Message-State: AOAM530G5H0G9OLes+2WTUIoUFWjiAALo13HYb/0R1hFPpUH+lWQck+r
 0HmMLOme8L9i+2jIY5Cl8r0=
X-Google-Smtp-Source: ABdhPJyBTbWQofkLZagquDjG9lbkYzrBpw9Upf4+oWfrAK92O27ZEcstN5rGCkuwVjVRZcJhDkYdcQ==
X-Received: by 2002:a17:907:209b:: with SMTP id
 pv27mr45399433ejb.475.1620932473827; 
 Thu, 13 May 2021 12:01:13 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n2sm2970022edi.32.2021.05.13.12.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 12:01:13 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <YH1QJZGYQXc6x9Et@redhat.com>
 <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
 <YH1gtK/JFtVE4lF1@redhat.com>
 <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
 <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
Message-ID: <91f0dfb8-ea88-8e27-db76-751e81f9ae2c@amsat.org>
Date: Thu, 13 May 2021 21:01:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:48 AM, Philippe Mathieu-Daudé wrote:
> Not sure if following up this thread or start a new one, but I got
> blocked again from Gitlab, tagged as a crypto miner for running QEMU
> CI...
> [1]
> https://about.gitlab.com/handbook/support/workflows/investigate_blocked_pipeline.html#trends--high-priority-cases
> 
> I pushed 5 different branches to my repository in less than 1h,
> kicking 580 jobs [*].
> 
> I didn't try to stress Gitlab, it was a simple "one time in the month
> rebase unmerged branches, push them before respining on the mailing
> list".

FYI I got my account unlocked (without any notification update).
36h passed, maybe it is something automatic (block the user for
36h if suspected of crypto mining?).

