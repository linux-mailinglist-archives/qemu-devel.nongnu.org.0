Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A071337CD8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:46:28 +0100 (CET)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQKJ-0006yq-3R
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKQ4s-0001xR-0L
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKQ4q-0004n2-LM
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:30:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id x16so121705wrn.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VjmY3tfeH2ew11BJh94/QvDK2zd2MJrW2nYfLEt7jvs=;
 b=qwGGL1IdQLrHeys88dW5qtLrXqiE+Uxv3UiH1Jwnl8jPBkT8f/izJgwxpyz/D3XzjR
 HtaphHx6OkCVy9Uj6QEyCNPosK1hohev+O3gva8qyWkd2xVm1fvtdD0zjJMh+X1kz+Ph
 2UVNuHAEqD21576nqAJYu9sFdkP3GHBX1Dxqr81PodT9LUt50ck9IMv4TjwrH1SqqBfY
 QCdzBeXPF19QZioGm22HWu/T0YvOGZSjcGM+vcnDXTD3vMQDRgHn4JcD7VFUCjIvpS1/
 zubbcxvZftc+GDvZdmPh22JiejVqpwYVJzIuXItImOQ+oxkhc/n57nQEZXWBME61CbUr
 eo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VjmY3tfeH2ew11BJh94/QvDK2zd2MJrW2nYfLEt7jvs=;
 b=STJ/rj0wBwuybRXv+mviwgGYB2S3WcbQJl6nxQfUMRVYtGT0+WviIaU38OZUCOu3cZ
 7Y3CWBZyaoRKkkPNMv4aB86DLJAHOvUsCzWPLmiZBNrVXBxvXNgF/d6fMygYE/J1cynk
 n1SEi+iHe8HfbSJ9dL6kUM2f8cxmmhp5U+y3ys0S8j0SxkDQpDq7W2kiYN0NDZL4ZlVX
 /lAsHfGA5NAWd2A3qLHmPq0zT3okhPtu7717Ivx2yhTd/tHF7o76MiENVS6wqM6v1jh2
 Mnsw7uhJii28eTOrgKO4wWDU8O1gl/tn1OLtsESze338cx8OcWeDEEjeQKcz7+JTv0CF
 Sj9g==
X-Gm-Message-State: AOAM532+GJ0kwvW/Bitbh15Rjezl9J9fTDSBE1exq/p3LUCOppA91Dji
 x4HcGvC6Jrrpw6fYSGWwPYQ=
X-Google-Smtp-Source: ABdhPJw7oFwDleUw6+tBou2Xpk+FUvH6gezxhpgkqv7ZhtOZNaPgAKYTL0vHLQRnWq4GLiH0nnss1g==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr10434130wrc.162.1615487427192; 
 Thu, 11 Mar 2021 10:30:27 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm4628197wml.42.2021.03.11.10.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:30:26 -0800 (PST)
Subject: Re: [RFC v6 25/38] target/arm: cpu: fix style
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210311133026.14052-1-cfontana@suse.de>
 <20210311133026.14052-26-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7cd5cfe1-40e0-dcc7-e375-d1298373c866@amsat.org>
Date: Thu, 11 Mar 2021 19:30:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311133026.14052-26-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 2:30 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu-sysemu.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

:)

