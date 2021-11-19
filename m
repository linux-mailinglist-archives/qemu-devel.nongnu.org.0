Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6F456E26
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 12:22:30 +0100 (CET)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1yN-0000EF-Qy
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 06:22:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo1w2-0007kv-4V
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:20:02 -0500
Received: from [2a00:1450:4864:20::42f] (port=43642
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo1w0-0001AG-AV
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 06:20:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t30so17499355wra.10
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rK7ndhDh5+2FqD10YbYyu84DvBTza1Muqqeha1GY5JE=;
 b=TywV1xQfsehkPuH8xlsL7YecfG34Une0IBCdaeNGX786jf7/jFmLOJXRNjMSD7LHbC
 0LMes6ymNJ4KQR6bLkXo/eSA6FFyi158DHXaGhC1teID+Z0+vqmWgVitES3mwIq2cqfo
 B2dRqEjsp1YtDRGWmlexCD/dTdfX6bvE+evFhEq5SsruxgKKq1PQk5qKA5WmYkB/8SDc
 b+szsA4ndx31yhOQukQtghP4S5y738R6qx6QENVYsJuEOj87Bp2byKo0NEttDmE7JtMl
 I4oIaJ92YJbUioFSVteDMwwEDenXxwjdy4iINCgblV+NN9Doh/MSZ6rSQ32kznLchYk2
 2ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rK7ndhDh5+2FqD10YbYyu84DvBTza1Muqqeha1GY5JE=;
 b=5+1ZDQXtlDWr4+NmOW4Jdst7IflCjv0BsDgxfrTq7uPzOEkn9Mct94SSLxf8ImeTZY
 bcZcRYu4B1rZvTPl6wUKHF7KzbE8b0DE+IJJXCvd/TI1kPm2XhysWqkC9Gvg6qKYk0dg
 SysdWxyBe+5E0Cx/m4uxxmyS77DwImu1rSiStRE5qS9uL91LuisCTlNFDtRLINcsgN4E
 Njzn/RUrcmqR8773ClxgH0L+3hPPtpuxk4+221JtzG0nL8P4e/FNaeB5YhCLouNcSeCE
 oICsuHgDjBGAusyrMiyHSvfrHciAYquyvnxNY/pAVWDDYE20Gyu7PlQctP0Lqmt4vbLm
 LrQQ==
X-Gm-Message-State: AOAM531HZHBUugrmmUAqcm7LdjjdMmYkSCdmbAov3QHEAtpKr0yhCf+R
 8s/F0OolQ+kIzvOzklOGs6v7Wg==
X-Google-Smtp-Source: ABdhPJyQRZJeGQFiYIOZ8zyq/YFfWSOqYPTjq7AMWjhGUk9KLGdO3mysdYYyluskPecbBnRdGcTnGQ==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr6223722wrt.413.1637320798082; 
 Fri, 19 Nov 2021 03:19:58 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id d8sm2753926wrm.76.2021.11.19.03.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:19:57 -0800 (PST)
Subject: Re: [PULL for-6.2 0/3] hw/nvme fixes
To: Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211119080954.211927-1-its@irrelevant.dk>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fa5507e-66f7-99ae-4126-834f49606164@linaro.org>
Date: Fri, 19 Nov 2021 12:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119080954.211927-1-its@irrelevant.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 9:09 AM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi,
> 
> The following changes since commit 44a3aa0608f01274418487b655d42467c1d8334e:
> 
>    Merge tag 'sev-hashes-pull-request' of https://gitlab.com/berrange/qemu into staging (2021-11-18 15:06:05 +0100)
> 
> are available in the Git repository at:
> 
>    git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-for-6.2-pull-request
> 
> for you to fetch changes up to e2c57529c9306e4c9aac75d9879f6e7699584a22:
> 
>    hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947) (2021-11-19 07:32:19 +0100)
> 
> ----------------------------------------------------------------
> hw/nvme fixes
> 
> * Fix CVE-2021-3947
> * Controller hotplugging fixes
> 
> ----------------------------------------------------------------
> 
> Hannes Reinecke (1):
>    hw/nvme: reattach subsystem namespaces on hotplug
> 
> Klaus Jensen (2):
>    hw/nvme: change nvme-ns 'shared' default
>    hw/nvme: fix buffer overrun in nvme_changed_nslist (CVE-2021-3947)
> 
>   docs/system/devices/nvme.rst | 24 ++++++++++++++----------
>   hw/core/machine.c            |  1 +
>   hw/nvme/ctrl.c               |  5 +++++
>   hw/nvme/ns.c                 |  8 +-------
>   hw/nvme/subsys.c             | 10 +++++++++-
>   5 files changed, 30 insertions(+), 18 deletions(-)

Applied, thanks.

r~

