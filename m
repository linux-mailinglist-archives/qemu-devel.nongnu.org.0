Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DBD4EA305
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:33:09 +0200 (CEST)
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxvA-0002yp-Fv
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:33:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxsz-0001Zq-Iv
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:30:53 -0400
Received: from [2607:f8b0:4864:20::536] (port=42975
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxsy-0006at-8T
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:30:53 -0400
Received: by mail-pg1-x536.google.com with SMTP id o8so13258307pgf.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p/FZSxnwO0t7mHDoyeBmv22yQnItvu7U4f0xPVLL29w=;
 b=au6VC24T05E2lU3+6hazp13w2PHGX0pKaHKs1o3K0xRftuaH2A0BZv84ixk+AiWrCR
 dK/wtHWbQAUJSHiq92tP94mEtynRICDudy1W1cxIwZDfRj9oXlzZVsxI294JOkvBkGO1
 jUzEI6V3ltq5mdudF+rT5F0FenOP89jDBmroDT3auOelxapnr3Jhw0WBAw4lyZ5t+f10
 MQB5OX+qKeVyZTkRwVSpEmeNNGBA6uEojnV2Nngyhuuu7VuBcrmziO1d8IuGJJcvYeSG
 E/ZE5cF6OvNjZU/zCRLxN75HVJi+wqF10DOYqC+G7jq8WlizqgTV04m18zK43/Cu2iVN
 mtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p/FZSxnwO0t7mHDoyeBmv22yQnItvu7U4f0xPVLL29w=;
 b=BGoBSMNkdqfW7ign6W7+sVoietrnKv7O/gHmyNodCPjKq54Wqm1aSPZL8NULkbqsRG
 v1YYeOCSCWe9H0OUkj9WJLqmCeaeeJkfYu8YiqFRXLsOvA/r2qmdeaJXW59avkLb1gTj
 J21HRkyTSCOu82YsU8cWo0B2zqkFdgXPvN/4OyxSga8qDqj3fHCVCWfyVVtq/j9GPhXa
 p4ZIAjArI7/EMzJi1unWYi3JuzFhSK4QdiquzJEr1vJMTWrZcUsoRuTjh0nZBjWZyf86
 0PyLBC1TCaJsleSpMhmJigXBzUS4TIlIEXuc7/B8msjYgeZbCrqwp1qH6yXsYtjrInxM
 zpWw==
X-Gm-Message-State: AOAM532cSedBIOpBtD70tcKbpLVXuTamlfIqAG/1YC+uVqgcCohjkHVb
 ejNpKJatqFBNCHaeQc3hZEsiLXkwPayyNQ==
X-Google-Smtp-Source: ABdhPJzOStiTfA1030UKFiaS0h9UluWMPPQ2lAyYH/itDTAEivULBgBPNVOr2v/OhnzxKvzlZUfsvQ==
X-Received: by 2002:a63:ea45:0:b0:380:c32f:2a0d with SMTP id
 l5-20020a63ea45000000b00380c32f2a0dmr11395850pgk.315.1648506650826; 
 Mon, 28 Mar 2022 15:30:50 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 a71-20020a63904a000000b00398666dcf8esm2528103pge.40.2022.03.28.15.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:30:50 -0700 (PDT)
Message-ID: <d8f897d2-cd3d-2129-e05d-3156967f61b7@gmail.com>
Date: Tue, 29 Mar 2022 00:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/3/22 14:03, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> See comments in commit 29cf16db23 ("buildsys: Help git-diff
> adding .gitattributes config file") for details.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitattributes | 1 +
>   1 file changed, 1 insertion(+)

Not a fix bug queued to darwin-fixes.

