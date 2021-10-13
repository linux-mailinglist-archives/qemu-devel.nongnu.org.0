Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9342C8FB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:45:46 +0200 (CEST)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majG5-000760-VR
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1majDM-00053p-Ch
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:42:56 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1majDK-0002A4-Ow
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:42:56 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w14so2453505pll.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/zM5CBVcQZIsWAylYTcFEJCj9HZFerIgKPMx04c8mBY=;
 b=c6RGt7K5Oh4c9cAo+0drryjIPc7gAmu043pF9femAh4on6EiYVguHo76vJw+4b8y8+
 Kd70drlKMQ6spiSENETGqFK2fFBZNNbTLBHexswR8txUHP4oo0EcG8BiHHWxT+uw5EkU
 9WRa0kGjFTVDNroEJYbOtvkSGUt68e9980f5Isb+Ttrrl2Qp+kzzvz+yJUY+JgyZ+EZG
 l07EtaKnW43/c9Mde0Zq67TLxhu4JH5VxjAzRi4oeCKgLMRipX7WvUj7N839qty+fmbe
 3jfv4QPsbf7aKCUOwWOLBqvK16ffHZUKJWiI+5BzxUGfbuptekYbTBWs3qjC1jS/yvgj
 KlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/zM5CBVcQZIsWAylYTcFEJCj9HZFerIgKPMx04c8mBY=;
 b=KpVGIG5wE/GTbO5wXuLZFKdKzVAxtQKnBiJMFujdbCjeOV3nPskC44YpnfP6qzsdIo
 A7QaW7RnN/CkPLsbQOEvNDnFds0hmWYS6U2djs7p4niBWJ7tBPf8902yH3jgVZB03isw
 3c+KVcb/2NoRfSA6jwXvBVUGKAQbus+h0elhgCVj72TmNgZaEiX11/vLyROtP7t3SACJ
 zlfBDJLZ6O95omdEoRuEarZH6xxWFQ0CYo+cJXaTJBWCR+9z0PLyJFrMf/09puOQbtL/
 +qL8xhHfV+5/hcuLH7fWzMjtD8G8Y5JXjY0jAAncs09y3Dfz0i4FD4RhR6jjpzjQ5em9
 hPGw==
X-Gm-Message-State: AOAM532l2cG9latqI4pBsxKhJB0W2sQr/kNmwTVKjsPrCP0b0OYPdkng
 qj7y0tdnAu3I00eEfdJmiYtL+QkQcz8=
X-Google-Smtp-Source: ABdhPJy3Wy/tmn82VicMiDlixyVd7Cm1Oc3TXbJYhF6UEzpMobbJYmnlVduaPlPqWdlkx9D6OzaUOg==
X-Received: by 2002:a17:90a:650:: with SMTP id
 q16mr15388951pje.72.1634150572322; 
 Wed, 13 Oct 2021 11:42:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h3sm228315pfv.166.2021.10.13.11.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 11:42:51 -0700 (PDT)
Subject: Re: [PULL 0/2] target/alpha update
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20211013173721.989655-1-richard.henderson@linaro.org>
Message-ID: <2c25d899-53e8-e211-70db-617a67dc9528@linaro.org>
Date: Wed, 13 Oct 2021 11:42:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013173721.989655-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/21 10:37 AM, Richard Henderson wrote:
> The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:
> 
>    Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/rth7680/qemu.git tags/pull-axp-20211013
> 
> for you to fetch changes up to 5ffcb33426aaa2906daea2eee7a5195662a6580f:
> 
>    target/alpha: Reorg integer memory operations (2021-10-13 09:18:23 -0700)
> 
> ----------------------------------------------------------------
> Cleanup alpha memory ops prior to prctl PR_SET_UNALIGN
> 
> ----------------------------------------------------------------
> Richard Henderson (2):
>        target/alpha: Reorg fp memory operations
>        target/alpha: Reorg integer memory operations
> 
>   target/alpha/translate.c | 173 ++++++++++++++++++++++++-----------------------
>   1 file changed, 90 insertions(+), 83 deletions(-)

Applied, thanks.

r~


