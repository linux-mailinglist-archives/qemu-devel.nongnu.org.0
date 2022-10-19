Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187B6049C7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 16:52:05 +0200 (CEST)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olAQN-00009T-SM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 10:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olALT-0005vz-Ev
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:46:59 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olALQ-0005Xb-PG
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 10:46:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so159991wma.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 07:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=e3CNJR4QS88HvnwtBSl41wTR/zmG/zG9xm1dKy2hdG0=;
 b=RLaFX/Dp3vnHi7EJHhSX5b0GIwsMg1yBfJYKUnwXS1cwlDmgjvqMKlg74E60lsiytg
 asoB9dkZbge9csMKtXHnImgeTbKEblrhN6dCjW09KPDjEiWEjZyxsul2DnJiaQxcrEsD
 r381NrzshWlQHwKsJyCQL+X6C+jXyBUrUrcbX4LPeA+tobEE0L6b3mMcNePasU/qGhW8
 xC8DrRSYHSQM43Shmy4Uvz6NL/jr6kw+svjQJWt68FwiAlZyY94cU1JENTq+muMASOzY
 azh2EL/KQ3Nrn5j7jkLmpR0LN5OBD6Le1aDNNr5MQMKl4qVk2L05rS2WedHAdxBx1zBE
 FRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3CNJR4QS88HvnwtBSl41wTR/zmG/zG9xm1dKy2hdG0=;
 b=qaQ4d6/AGhJmGepI5CcHw0ADYlptj9yT7xCFA85oUb8y9BfmM/V9g9J0Y7wIfxqggo
 eN37P3uzwuDmyPBAfMY45q7giAiZsIl6WvoX4+kKdxsGrIBOGHMq+CAeb8403w+x6UfR
 HUSxkyY851q1w8ZHaK2J0rq06fCz646HAcIlroichAfqOuVKnokdHKGQlS9xvwwPfCsZ
 PoMmVbuJQiTpnW86jZXldbRHIJmoybFdxP9jD4b17qTrltdxvffvmgH8sgRJ2PHghsjE
 PYjp4LlEyCnQfltiJZ4XGe3/rXKWj4a4g4yHbVVeepKIXjgvOcL981QdVAcovL1DhpNN
 1i7Q==
X-Gm-Message-State: ACrzQf3W49KYN8sVxD8ksZZIoT0piB96lD9o3KzvFFX4y3FYG2qfETk+
 ye5V3qXBaaCHruiAopAQq94=
X-Google-Smtp-Source: AMsMyM60hDMlihxQXeLTz6qUTDrTpSHzW00hsuj5yzeuBTXayoatL+q6lxxLGEJhzi1YDWR2UimQIw==
X-Received: by 2002:a05:600c:230d:b0:3c4:2975:321a with SMTP id
 13-20020a05600c230d00b003c42975321amr26929174wmo.155.1666190814830; 
 Wed, 19 Oct 2022 07:46:54 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00228692033dcsm13430511wrp.91.2022.10.19.07.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:46:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <66161258-9b2b-400b-4ed5-e980394f905e@xen.org>
Date: Wed, 19 Oct 2022 15:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 01/12] hw/xen: Correct build config for xen_pt_stub
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-2-vikram.garhwal@amd.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221015050750.4185-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/2022 06:07, Vikram Garhwal wrote:
> Build fails when have_xen_pci_passthrough is disabled. This is because of
> incorrect build configuration for xen_pt_stub.c.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


