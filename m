Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9CA43E6A5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:52:13 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8dQ-0005jw-8L
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8WG-0006k6-Fw
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:44:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mg8WE-0001VQ-1k
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:44:48 -0400
Received: by mail-pl1-x632.google.com with SMTP id z11so4830337plg.8
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=x0xIrGA/SiG4hpSp+PexkcIGKqOAYiaFjTIrq3gYggo=;
 b=FLsRIyjndIN6OdYo0QFJygzxqZFbFqY+tEHCeg7MIYlOT46VCSuJ/lFQbE1aaDutwD
 WvMNLoBnWWPAUh50OXtNQmvjANkrTalTfGIVEtnh597A9rmqxuaVq8o42GwNfHf+wDmT
 MMk7B8pkARLXHCbKqMJz1Od1aP6joopQtbInsvgBhyRym5/SeistLx9fSbimVGZLSUPW
 oqf6+ua+Y9cZdlldGCaVkjOg9jZLUS5aubuCxLw1WvCsbU3p1f1WyGJ4OlCQvRS5OJ1c
 UuvjHoO5E19WcYV+mNDuQEQur68PHmeUWbyVswqZC7gli96yt4xf33dXll8TzD0QcCW2
 UwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x0xIrGA/SiG4hpSp+PexkcIGKqOAYiaFjTIrq3gYggo=;
 b=DvkGiNRZLd/QzepUaqqF7KxCjSQ+19epbTeOD4xmXdrJogE4o50P5RvMKBRJ9byEYC
 UJqehLgrTBwTnh5UjWsbLmtaaEqIBaV8GTIGyxeIoYqdSzNqJVRrk6n3q2kMAYJR2Z05
 dflP6XjxW4FpAwuVb6xDVMG7mTGssl76lCQ5ZGPsj5CmpC6jRz5TfE3zbwfBKKw/atM3
 tt/AC4Z0OAySJZeMRw/cVJoPRKYhhH5PSgiNmsQOgH93fxywdyHL0jbG8iNox35i9QEL
 AGEKIKB+om0fv4qXiQmKF0Ef2dXPn2GlpHAXpqy7oOqfDQhumRQjtBBphPSmzCrZjQJ6
 4Esw==
X-Gm-Message-State: AOAM533Fr8WOlMJZGOm0QkzRqiy+NzWXk784tPVbeXzkXA96YTb27tMw
 4CRRr9gvEHGBztuDs7QRuIHerDnNtIz2Cw==
X-Google-Smtp-Source: ABdhPJyaa+t54Q5OgBrYGtpB+x1TWTRswV7wHtzmPh0XTWGLXNs6hMvvdBl0FeW90nGAp1WPO0/NXQ==
X-Received: by 2002:a17:90b:390b:: with SMTP id
 ob11mr5661301pjb.217.1635439483981; 
 Thu, 28 Oct 2021 09:44:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z6sm8548599pjr.35.2021.10.28.09.44.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 09:44:43 -0700 (PDT)
Subject: Re: [PULL 0/4] Monitor patches patches for 2021-10-28
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211028052955.454209-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a512e6b4-6ebc-5e00-9989-9f4db28053d3@linaro.org>
Date: Thu, 28 Oct 2021 09:44:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028052955.454209-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 10:29 PM, Markus Armbruster wrote:
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the Git repository at:
> 
>    git://repo.or.cz/qemu/armbru.git tags/pull-monitor-2021-10-28
> 
> for you to fetch changes up to 47c849357b57c1fbd3d3355c586c4784c6f4188e:
> 
>    qapi/monitor: only allow 'keep' SetPasswordAction for VNC and deprecate (2021-10-28 06:25:08 +0200)
> 
> ----------------------------------------------------------------
> Monitor patches patches for 2021-10-28
> 
> ----------------------------------------------------------------
> Stefan Reiter (4):
>        monitor/hmp: add support for flag argument with value
>        qapi/monitor: refactor set/expire_password with enums
>        qapi/monitor: allow VNC display id in set/expire_password
>        qapi/monitor: only allow 'keep' SetPasswordAction for VNC and deprecate
> 
>   docs/about/deprecated.rst  |   6 ++
>   qapi/ui.json               | 156 +++++++++++++++++++++++++++++++++++++++------
>   monitor/monitor-internal.h |   3 +-
>   monitor/hmp-cmds.c         |  48 +++++++++++++-
>   monitor/hmp.c              |  19 +++++-
>   monitor/qmp-cmds.c         |  54 ++++------------
>   hmp-commands.hx            |  24 +++----
>   7 files changed, 236 insertions(+), 74 deletions(-)

This has some sort of configuration error -- failures all across the cross-build tests:

qapi/qapi-visit-ui.c: In function 'visit_type_SetPasswordOptions_members':
qapi/qapi-visit-ui.c:64:10: error: 'DISPLAY_PROTOCOL_SPICE' undeclared (first use in this 
function); did you mean 'DISPLAY_PROTOCOL_VNC'?
    64 |     case DISPLAY_PROTOCOL_SPICE:
       |          ^~~~~~~~~~~~~~~~~~~~~~
       |          DISPLAY_PROTOCOL_VNC
qapi/qapi-visit-ui.c:64:10: note: each undeclared identifier is reported only once for 
each function it appears in

Can be reproduced with "make docker-test-build@fedora-i386-cross".


r~

