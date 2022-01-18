Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E349208D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:51:34 +0100 (CET)
Received: from localhost ([::1]:38694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9jH9-0008LF-Kv
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9iuT-0008CB-GO; Tue, 18 Jan 2022 02:28:05 -0500
Received: from [2a00:1450:4864:20::331] (port=56160
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9iuR-0004DW-VW; Tue, 18 Jan 2022 02:28:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id c66so25532313wma.5;
 Mon, 17 Jan 2022 23:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NgyRMMTOvGQ3pt7/EL+KqgY2x9nGQO8woZhOsts7YiQ=;
 b=icc/iT1WgKpiz8DctvwrKbYXhhguVyNACwKaOMgJ/7IjFF+PoESvzQQVPlaBU15gyJ
 CXIvBXrRjh3WM59pkKd8/ztVut4CkCFA16l4AB6Ym7LSQjBMe13vHrond/5HTUnkz1S/
 o/1VlSE+4tXMv+brxXGlvht33rDVVY7EDX1Zy2LNfqj5ImBGtcyJ3mkvZTYHmAX/RX1H
 eyLnx62nDgCZVJfN99qjW6e7oA11ILu16s4rTmImbYE6bLxEz1rl5LaiAfiEs+x/qdf/
 3TNU909ghQwQF1519iaTZ5dD3LkxZLdDMgfnKlNqU3pJw+todIDK25zRaFd/NHKVLofz
 1OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NgyRMMTOvGQ3pt7/EL+KqgY2x9nGQO8woZhOsts7YiQ=;
 b=2nts2VtQjAMGKMPw/XzGYfGPwc1laEIyyEeIQE6EaJXTHNIYZYsydiks/5J6CXd0N3
 ZSGmV1ngNOvvIzhPwujOQWee/1HlVA5RhdMPkVEpeFJEfZuvUYsxPIdAFHKb9ng6dZJr
 9ABe74PILgf5pszKaZPpEZE0i3bdcsV4mRzZ+/euRSq0KCQ2xQylZM1VCjL3fNdSwCsU
 QnxwctBPcTB+vgztsXVghyACzmps6Je0syYdmoWfEr56qVwjsxOlkhczWy1rWnc3JpHY
 1Ht04hTzyA4aQ0jXiBztKDml6WWpfNT4RkO9TCSABLkXL6k/wrkqg4EDxuISMja+opSZ
 V4Jw==
X-Gm-Message-State: AOAM530v3zxwA8m6T4L5YCC+4IouMln9rofJr/q8163wYrd8yXMFJbLS
 oablHBPK+J725kaXD4/9K55/hHuE5Hg=
X-Google-Smtp-Source: ABdhPJynNccjCJzPHntkISwIm+9x/LUGqof6+V2VvaHKH3Ok6uuLWEItOq70E5PV8O4FJtFDemkOPA==
X-Received: by 2002:a05:6000:1a43:: with SMTP id
 t3mr11512863wry.237.1642490882129; 
 Mon, 17 Jan 2022 23:28:02 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f8sm7256299wry.23.2022.01.17.23.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 23:28:01 -0800 (PST)
Message-ID: <0233464f-3ffd-9eb9-feda-f8859c0cfdda@amsat.org>
Date: Tue, 18 Jan 2022 08:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 6/6] docs/devel: add some clarifying text for aliases
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-7-alex.bennee@linaro.org>
In-Reply-To: <20220110175104.2908956-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/22 18:51, Alex Bennée wrote:
> We do mention the limitation of single parenthood for
> memory_region_add_subregion but lets also make it clear how aliases
> help solve that conundrum.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/memory.rst | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Thanks, queued via memory-api.

