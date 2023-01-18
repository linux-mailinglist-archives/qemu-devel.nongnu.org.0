Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E01F671809
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:43:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI4yc-0003ud-R0; Wed, 18 Jan 2023 04:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4ya-0003uV-FF
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:43:24 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI4yY-0003jz-S9
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:43:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id z5so32248192wrt.6
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OTMOT7scZcVmVpa5eKgTHlKY2+htaQ7TItlwF+VO8E=;
 b=pZ0Hm3ge2eMqiB6vClqvZzmiZ332P8Q1R7L+P2LieuoEuW258ognHX8Zq/3matnd/8
 e/i776segbeXz0URc2Hrcio5KoRqVwF4sBvmtFeS/XQyawJK1hFYsVlNLwgtSJBOysPS
 hpl0QBVJPkqBVCVM0HiiMShj+dvMGhKOq3WBDsYbOEC2dCY01qCY21WcJGCZnE4Xaoza
 Vog+tiCxBnOUDT+gK8zoR/rQv8uLhAal9msVLBrptSTrK/2O4eKJAS57hPpJEVaRToYL
 ErulpNwxJEP3mqom/H8cBzxRypJG+dCbwhtZPK5Egt3+TYDoyd5bkff2Z4epa+ugiBBK
 OJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OTMOT7scZcVmVpa5eKgTHlKY2+htaQ7TItlwF+VO8E=;
 b=aE0Q798TIlH/nepy3965EkGzZJ7RZbzCTUa+uNPFdO4IVZ29X6LfHf+LRh+rjtEZZv
 k1rPNXfbhRlHItnUz9/OfsqNnlEO+j7AWN+fn8ozN6BON/eq1TDhEv7PYWz3FHLrkNiF
 asv3VihldI6bfvTYsEjdlKC+Eq0eAFlvi1YMGdfTSlQSwMVppXvhqAfO42w6h2ho0A81
 MXWv/lJ6X1gpCkheH0S4+HA+uLtgQXNCrVtPqEufSaj5VRUDw+iSPAStHYNQUSEG9or9
 4GJgOXHWRVyOUeFAyeTrnajqHLKjLV62FJbrFIki5p+KCZ4fBy1q+jGWQZq/02mN7D2F
 tp9g==
X-Gm-Message-State: AFqh2koKbeSwRoRQlhWTHADLN0EcaRFPsBATrS09gBTd1r3+bR8qQihG
 JPlBdlfGkIBVuFje6+OxrARhDp9IrzPY3Wyg
X-Google-Smtp-Source: AMrXdXthEFPVi7JWjMljqJUgxNnlD51GpdxN/HJJDjcmFPLUgCGZt+6svihTIqonL/UFytC6iWfaSw==
X-Received: by 2002:adf:ce90:0:b0:2bb:edc7:504 with SMTP id
 r16-20020adfce90000000b002bbedc70504mr6194382wrn.26.1674035001309; 
 Wed, 18 Jan 2023 01:43:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d6d49000000b002bc8130cca7sm22890089wri.23.2023.01.18.01.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 01:43:20 -0800 (PST)
Message-ID: <509084a0-b7a5-d167-26e7-492fca101863@linaro.org>
Date: Wed, 18 Jan 2023 10:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/2] hw/pci-host/gt64120: Fix regression on big-endian
 targets
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Beraldo Leal <bleal@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Cleber Rosa <crosa@redhat.com>
References: <20230118094023.49517-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118094023.49517-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 18/1/23 10:40, Philippe Mathieu-Daudé wrote:
> Klauss reported a regression on big-endian targets, introduced
> by commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
> PCI_HOST_BRIDGE MemoryRegionOps"). Fix it and add the Klauss'
> reproducer as Avocado test.

Sorry Klaus for adding an extra 's' in your name :\

