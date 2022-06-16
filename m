Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD654E94E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 20:26:11 +0200 (CEST)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1uC2-0007jJ-Dm
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 14:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1uAh-00072b-Ev
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:24:47 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1uAf-0005sZ-LO
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:24:47 -0400
Received: by mail-pf1-x430.google.com with SMTP id u37so2194632pfg.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3SfwmbvdyxXdKYYvLTFKS1/5htBGlrfljvUYfo/aM9M=;
 b=inyyyVohHRXC8QrNjj+9XZfN1vg6dmseozzejBCODy/lSj4UF3EIbv8F0bGxDvrNAk
 OsCe+wkVGffAjkz9ls1IaokCSYM4zXLhUkU/kN1HUO3j525zJlj3L/u9y10ktpvu2FgA
 eQ8yKwLyZ5sx3ZG4j6s0l9cCcMxd2czYd/I1ErLqiqnvgbfcKdlObUZpAh4b8JMTeRZK
 7mhc87gXXUqaMjBvWDu/6V9Vw1PFXG6R3mWgzk3JkRTRkajE4VFru6xa8Y4vpjhtf9bj
 sTQ1xliMqxnZoAeFrFbzEjSc8h9o70lDmGJ5qpqVAk/jRi361oL4/ko0CGg7IHxTldEy
 2DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3SfwmbvdyxXdKYYvLTFKS1/5htBGlrfljvUYfo/aM9M=;
 b=aVF2CiOtTulBEf1Le3+4enRGroARyX6pFDUIJtqwayGZG0ZgEO/E1aHcJYahPoWdmU
 0JZ2jiNUZLuP/WPJYA1GqJC4l7BzZu2f5oIW4OicAZQ5PojtFw8GWWs7bdGTjgD4BStj
 gR3+Sd45+Xc/14pEPzem/U5FaQwk48LcgnffMHTF5ZlulzHv657G+YIO6nd70XXVFJmi
 Jqi0OjryW+KgwI9DvQa+J9zqFxCZjrbfn0dKLrsJ6asvIY+k2e6ar9OZCKhVMINWiCYE
 jYH6zGfVbzTxh7h9Y9FmAmpUoXcIW1MwdSkSptjNG0OHEGC7Biv0M48TmUDwhEJDepvM
 oFjA==
X-Gm-Message-State: AJIora/WcMi6/UnPgHgx/kXpyF7b5gKx8rCimFlHoytaz96kuyahu8qq
 d7gMcvoyU3mAofvgh2VKjEsHvg==
X-Google-Smtp-Source: AGRyM1sa8ZJE4Je4vSbbJJ7nniiCGLxB1mvYkBCymJFE5uPaJ9Wu4mki9I7ID3kf3kOdyuG19GfY9A==
X-Received: by 2002:a63:4e57:0:b0:3fd:cf48:9ba9 with SMTP id
 o23-20020a634e57000000b003fdcf489ba9mr5611855pgl.278.1655403883181; 
 Thu, 16 Jun 2022 11:24:43 -0700 (PDT)
Received: from [172.22.33.109] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79159000000b00522c0a75c39sm2080058pfi.196.2022.06.16.11.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 11:24:42 -0700 (PDT)
Message-ID: <83597aaa-f392-85e3-68dc-93e5c053ae57@linaro.org>
Date: Thu, 16 Jun 2022 11:24:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/7] 9p queue 2022-06-16
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/16/22 04:00, Christian Schoenebeck wrote:
> The following changes since commit 9ac873a46963098441be920ef7a2eaf244a3352d:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-06-15 09:47:24 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220616
> 
> for you to fetch changes up to 0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb:
> 
>    tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent (2022-06-16 12:44:52 +0200)
> 
> ----------------------------------------------------------------
> 9pfs: fix 'Twalk' protocol violation
> 
> Actual fix is patch 5, whereas patch 4 being preparatory, all other
> patches are test cases to guard this Twalk issue.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Christian Schoenebeck (7):
>        tests/9pfs: walk to non-existent dir
>        tests/9pfs: Twalk with nwname=0
>        tests/9pfs: compare QIDs in fs_walk_none() test
>        9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
>        9pfs: fix 'Twalk' to only send error if no component walked
>        tests/9pfs: guard recent 'Twalk' behaviour fix
>        tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent
> 
>   hw/9pfs/9p.c                 |  63 +++++++++-----
>   tests/qtest/virtio-9p-test.c | 201 ++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 237 insertions(+), 27 deletions(-)
> 


