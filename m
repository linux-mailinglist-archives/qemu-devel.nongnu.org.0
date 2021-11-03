Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2373443C3E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:33:04 +0100 (CET)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7xP-0001Q4-Ms
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7wO-0000jL-C8
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:32:00 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:46694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7wM-0002MD-Ja
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:32:00 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id g25so1538003qvf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lVaM0UiPmN6YB4m6NMtONq66uppdjnC3ubqqhVUzwek=;
 b=IQz0zOczM95V+31df32NN6jgrpk0kKIFh/b+tDACx0muQeVqaD3zW8g47YlEwX/NQc
 U+/hFA4P8pBBYn5KEyBEGZRitRQrscMAQY7VvPvlmb5MIVQ+JDbdcBwyzDvMWeVuPyA/
 yOwYXiKcGRyjEuKWqnBKx+6+bE8f8OWW6Iui2/w58MhhMDHbXKbc3eMzAa3tkLG6nwnY
 HAyk7+X2Pd4eljnWISmslAJBXWi912cG+zmuHTsLE8Kf1usyBTOa0etanJeP0fyUP/ZV
 SCli1t6NrXyuPP+cmj7XlkNOe4RzDK/7P3cXZIvb0To1KTFHJUG5y+74X8IFfyUUhQqJ
 IoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lVaM0UiPmN6YB4m6NMtONq66uppdjnC3ubqqhVUzwek=;
 b=QwhBFYKxK4iT3rMjdvbsR08y+vizKr2S+qDQ8bGBczqzgVPs4gFoaH72yu9mfDknYS
 MpiQVqOgyUuoouR2bKNCFAMbwEia1EAcgGYvobDO55izC8rBrwN/A/wal/cM8v0CwtcM
 wBRiu/IPnRmFX5qN/uIurukrrVhMo9XSahfvlztEWY6vbDn9mbGDzOn3miMAyOu+xP0P
 nKlFKu3CkvVZuM3I1lBWFhlJmzXPwoLAFCmgJnYvZpEZNtwsbmF43fE86f6gSLt80aQO
 jopnrPO8aZ1reuoKtWZOvBo7ZBTGASiScvIuALjKCHmq0AlJS61ZObCr9YDGoZDfhjb9
 598A==
X-Gm-Message-State: AOAM531KvuUsNYiwXkLhe/wsUYE25rS79MZpcw0caNVMpznngUquYmqD
 bYFfaHaZdk3LJeX2ldN3ofz6rMCu9u7yMA==
X-Google-Smtp-Source: ABdhPJyzCp6v91IqfXI066UNGQ20RQo0NURs339Goo7CWhpRZ0XaaAGv3Ik7PXmnlVdQuHS1XbXoLA==
X-Received: by 2002:a05:622a:2ca:: with SMTP id
 a10mr21631861qtx.151.1635913917479; 
 Tue, 02 Nov 2021 21:31:57 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t64sm734757qkd.71.2021.11.02.21.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 21:31:57 -0700 (PDT)
Subject: Re: [PULL 0/4] Block patches
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211102142219.697650-1-hreitz@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b612cbc4-52c8-28fc-1e75-f63e3d40f26e@linaro.org>
Date: Wed, 3 Nov 2021 00:31:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102142219.697650-1-hreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 10:22 AM, Hanna Reitz wrote:
> The following changes since commit 8cb41fda78c7ebde0dd248c6afe1d336efb0de50:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/machine-20211101' into staging (2021-11-02 05:53:45 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/XanClic/qemu.git tags/pull-block-2021-11-02
> 
> for you to fetch changes up to 7da9623cc078229caf07c290e16401ccdb9408d2:
> 
>    block/vpc: Add a sanity check that fixed-size images have the right type (2021-11-02 12:47:51 +0100)
> 
> ----------------------------------------------------------------
> Emanuele Giuseppe Esposito (1):
>    pylint: fix errors and warnings generated by tests/qemu-iotests/297
> 
> Eric Blake (1):
>    qemu-img: Consistent docs for convert -F
> 
> Thomas Huth (1):
>    block/vpc: Add a sanity check that fixed-size images have the right
>      type
> 
> Thomas Weißschuh (1):
>    vmdk: allow specification of tools version
> 
>   docs/tools/qemu-img.rst                 |  2 +-
>   qapi/block-core.json                    |  3 +++
>   block/vmdk.c                            | 24 ++++++++++++++++++++----
>   block/vpc.c                             |  3 ++-
>   qemu-img-cmds.hx                        |  2 +-
>   tests/qemu-iotests/129                  | 18 +++++++++---------
>   tests/qemu-iotests/310                  | 16 ++++++++--------
>   tests/qemu-iotests/check                | 11 ++++++-----
>   tests/qemu-iotests/iotests.py           |  7 ++++---
>   tests/qemu-iotests/tests/image-fleecing |  4 ++--
>   10 files changed, 56 insertions(+), 34 deletions(-)

Applied, thanks.

r~


