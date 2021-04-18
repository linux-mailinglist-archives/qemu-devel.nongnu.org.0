Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674DB3637E4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:45:03 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYFDy-0005jZ-Dh
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYFCX-0005JN-1O
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:43:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYFCR-0003Mq-EE
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:43:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id p16so12709496plf.12
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vVLHTN4+l3/d6ah20ug8h8vU7gXrbxLWpjhi+3HJyRw=;
 b=LOMG9zHdyQmbH68F3fXWr4pGFrrN7gJQ36mncen1jl7wItQNggQf5TZT8U1fmJUzul
 Fc9Qss7fG0huJ/7ZgF6vBwpxbVBgMk3UJXeFzIiQRKjD2ZycSj43wRYnPmgiVhJJGl6e
 B4WgY48dZU+dvn9TwGeHebUlL5WvtoRBF+VqaH9w0s/dkf3q7gqVgVJPPwWTFyT1nV6S
 92hw0s1vUPrEAso49F6mBGqSjNWZ6ryair3GkTVvkOdxFYEB9uDy/Jg0vuliAgzNcyIz
 enKU5rWrnDtHbLAFpsEC2eKeL/EieVy7FXH41SqIyAcoxHMSb3kUaLRMdc/GyvCh3XzO
 B5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vVLHTN4+l3/d6ah20ug8h8vU7gXrbxLWpjhi+3HJyRw=;
 b=W/z2OwT0qMETBu0iCGZPGpoQQhnr/Gn7pVszbSa0t0WhBad5LEydSF4bpS4wOyMFnQ
 wUJHKXRLzVE+EDMfBaX+2/6kPGfF1FBFH0mRBmggLqppUbrzjdClBtJPHpartiMC8Ge4
 elFE6Qhcy2OMyb6OhHM2hfKEiQ8hE0vYcJk4M3/r/f9o/q8jgi45YbPeKfVsKiWz2XMg
 Vsal1LiAU4b+I/5XsWFLy5ljYYI/2jgOKJyrVepAoMECMj22zC7iGt98iGcpspG7jgtk
 e7NATw82KwFL0HoTK774JKunncMGe7A0wb0TfeFdOH1+5ZmcbsH/CyqwwRJdZTPzjsN8
 sQdg==
X-Gm-Message-State: AOAM532AlCTPUWxBhrauZU5u2RfpZthXZFRR521v7tx8aiE65Xr/IMyx
 ELzeT4vlASWvtlhES7dcniG73Q==
X-Google-Smtp-Source: ABdhPJzhGFRsC73KMD+cuTmI9bhTnYMe9kQC0XPCbqt7JmgC8xlW61UdVB3ZYeqtqPtOUv1NHOrWzg==
X-Received: by 2002:a17:902:5988:b029:ea:ac90:529b with SMTP id
 p8-20020a1709025988b02900eaac90529bmr20566834pli.78.1618782205724; 
 Sun, 18 Apr 2021 14:43:25 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id t15sm11035617pgh.33.2021.04.18.14.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:43:25 -0700 (PDT)
Subject: Re: [PATCH v4 08/12] target/hexagon: prepare input for the idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-9-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <686ad6c3-fd8f-959b-4949-fd9ebe276e77@linaro.org>
Date: Sun, 18 Apr 2021 14:43:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-9-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> +++ b/target/hexagon/idef-parser/prepare
> @@ -0,0 +1,24 @@
> +#!/bin/bash
> +
> +#
> +# Copyright(c) 2019-2021 rev.ng Srls. All Rights Reserved.
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +set -e
> +set -o pipefail
> +
> +# Run the preprocessor and drop comments
> +cpp "$@" | grep -v '^#'

Any reason not to handle '#' lines in the parser?


r~

