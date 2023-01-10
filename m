Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0306639EA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 08:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF90w-0005fS-Vu; Tue, 10 Jan 2023 02:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF90r-0005ei-Ky
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:25:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF90p-00053p-OF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 02:25:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id e3so1523454wru.13
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 23:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZhLFIkhGctam2eQwWwvM8dReQysCzjS7lfywuGcGMg8=;
 b=Yx0XGLAN5EbvSwUTy4X+FluZ1823kOwNqnEbuaGBPV5THBb3uX+T8svLREibH5/UFo
 XXxt7W9RP9LqsQTgZAIWx1gJjx1VY4qAt4iLmlwjTVzs19jDgIExO8sflzb6nOQvu31y
 OROeiws8tfGGPw7LhnUh7IOOPTi6XzxpOWmuyj3Tb/u8hMS6ULMwYo9Yoi0k+Hi9YcKj
 m4AKXtkFruNbOB760hdxrUNRjtXD6jbdUmPeipFVCXEUWpId7eagHcB1qcfns2LtV/uP
 hE/6bAS2d/fTQJhR6hZGFB0gscCxL3rO9DqIBuSzCvgtZ9iikFUQYXarNPxyulcKD2r5
 hYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZhLFIkhGctam2eQwWwvM8dReQysCzjS7lfywuGcGMg8=;
 b=zY2x6cXR7V/jJFGDS5kjzEfvGdEQ3D++6ZNLCq2dlRM41c5ZjO74EdUomiS558jqCi
 Ir5Usz7A9K+bCVqoeuhVpPRrPw/ji8ZHH6qEx4eNKbnde9Hf+osJelkuMIQ1fE1yW8q+
 hkSia7VSjtu55f7TYIa+ym6MGCoPx71Z7AOS2TYgikTTHlCWL7eQPYBh0eY2CIa505SK
 7Bu/dLDg0VU7+s8scyQzELS7mqnJA8ytZqCuBF0t68NWaWYhaPHJwH+/dMkXAXDGPHLK
 YfFkpZMbzzupWdHg2IkwrhG5KncvOuvUon/p3et+PY28bfk/gWbzGgLypmapiNu84nRE
 OpJA==
X-Gm-Message-State: AFqh2kqzM9aAAmKqGoaeOw5zDigIKKiXs0dR2G4HWnfFVyuKYNX23/+z
 h2oQkwYHqVs2z2uLAvH+appy9Q==
X-Google-Smtp-Source: AMrXdXunEmyi4RJhFug2f47HXKeb7o0Jbg7cjmvyR0S9qL31OyRYuXEAwP0wg8CpgJDayjhfq9EBXA==
X-Received: by 2002:adf:c648:0:b0:275:618c:83ea with SMTP id
 u8-20020adfc648000000b00275618c83eamr43939863wrg.29.1673335534420; 
 Mon, 09 Jan 2023 23:25:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfdfc4000000b002bc6c180738sm4508526wrn.90.2023.01.09.23.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 23:25:34 -0800 (PST)
Message-ID: <8f5c85b1-9b1b-e633-9c0e-d488cebc3c4c@linaro.org>
Date: Tue, 10 Jan 2023 08:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 17/17] ui: Simplify control flow in qemu_mouse_set()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com
References: <20230109190321.1056914-1-armbru@redhat.com>
 <20230109190321.1056914-18-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109190321.1056914-18-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 20:03, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   ui/input.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


