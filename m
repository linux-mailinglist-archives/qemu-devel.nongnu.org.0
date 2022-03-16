Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBA14DB1BD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:43:01 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTvY-0006Z8-2f
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:43:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTml-000516-Gg
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:33:55 -0400
Received: from [2a00:1450:4864:20::435] (port=36544
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTmk-0005gs-33
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:33:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id r10so3024760wrp.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GHMDCubi3Eu1VM1mmSQ33cPY8h+p2gqupbJqhK+eTxg=;
 b=oQbMCaiQjdhiYgVnFp250lKjhF/QpzZDgGe5uzzNt4HvdpRbwN/rIvstupit1EJUx0
 T4AM0Y2bB8m8qM0ELDxmNMd1Bwgug2caJEL9zYiL5oYm2dL2e+HW0bzvUSRDKgiU0kks
 d773br3/JLsFeGuI3d06PdQroGWhNphLAm1UQy815BQZ1c+0+Ts8IFb+mPhjXblpoOQN
 ST5lZObdOrZFSHGkuS/pWkEpU1hYYGNxmoHZjRN01ytIpui+5CaBXnRWZL45g4vtqnrs
 1zzc3vy1PycTiGrMmDkDkJSkHjmLJeAJLI2JiZLLB2A3ZbnCQLi+DSa9hHOyv8EwP8UI
 J9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GHMDCubi3Eu1VM1mmSQ33cPY8h+p2gqupbJqhK+eTxg=;
 b=AgiNajgQHdgr+QGoJjtYr9P68ypGWuwj1g35YYzokiPxmmy5biv564uBJBOiZ06CmB
 IUYroz6lW8zSu+rt3P7+ETLF8E90s55gBEgDn/QBHp0A3elltEDxLKzJECPabYnw7B51
 LnapZVB7T3IR3CMbEnFd8Be/ImoPtdluK8JGmFiBcZnnV2XEwS9lUnLYmmVnJzXotGev
 NPjFbtqp8maKMUhMptNKYCsCMhNDs/2UVuv/y8PwCjX7ccd+njJAbw9JG9zkn5F9WbLZ
 8empgF5+RIW2PNwbc8xUJucq1KQCjRfnihsbj1H37AAe+RW6CHco6E5KmKyj3phDs1vL
 BSpw==
X-Gm-Message-State: AOAM5308l/ySpoT08bO5JP4JJYisHnr1gGx0n6omh8KQHzeUcP5Txpel
 chkKcPSQ9xxiXSM9X55NOIghBHGYyZs=
X-Google-Smtp-Source: ABdhPJyNTbGwF/djvbe/1c1lrRoS/RHreCHdEFhxNVnC9uMcEu6netGch44rIkE88ucFvYQgpGfqBw==
X-Received: by 2002:a5d:4084:0:b0:1f0:2381:871d with SMTP id
 o4-20020a5d4084000000b001f02381871dmr23760340wrp.663.1647437632475; 
 Wed, 16 Mar 2022 06:33:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f186-20020a1c38c3000000b00382a9b91515sm4877391wma.37.2022.03.16.06.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:33:52 -0700 (PDT)
Message-ID: <79693bf8-6cd4-f7d8-f820-1f28bba5aea7@gmail.com>
Date: Wed, 16 Mar 2022 14:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] hw/display/cirrus_vga: Clean up indentation in
 pci_cirrus_vga_realize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220316132402.1190346-1-thuth@redhat.com>
 <20220316132402.1190346-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316132402.1190346-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 14:24, Thomas Huth wrote:
> Most of the code in this function had been indented with 5 spaces instead
> of 4. Since 4 is our preferred style, remove one space in the bad lines here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/display/cirrus_vga.c | 57 +++++++++++++++++++++--------------------
>   1 file changed, 29 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

