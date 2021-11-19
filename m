Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54792456CFC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:07:25 +0100 (CET)
Received: from localhost ([::1]:40454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0nj-0001xd-WB
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0i2-0005Uy-OA
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:01:30 -0500
Received: from [2a00:1450:4864:20::42b] (port=42708
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0hz-0008LU-FD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:01:30 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c4so17136691wrd.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MzZO530+2CXxCdmaG5cz/gjiD6kJ7s8WrnI0bSV2iKM=;
 b=lsj+t7eXzWVPWjDhMiD9+u0guS48NA1E8PASfK5w7KwbGaqc8GhOV/8f4bFWov75kZ
 6Ai3fBdyh6emYJJ+Q+VrUul5/BVubgtJX/WZeUlO5No43mzN5IUIUgnqpTVytxlv5Rmc
 k/evMO0A1hFZLVHxI+kGF1dgAT9GhDvLsEJn40pvYPcpILqN3Lun+ARK8S7mvnhimoqQ
 /hkhu26HsGVImD71ZfSr48txwY/FN3GO5emVCM72wWe8+RFlyUy7wudz5ofClm3wdOaX
 pFM3Ricunbx9iv8e6rO3t6QDWpPjuIm5vxcQ/tnYh/hhr2Q2Jb0r23kqhPbP7FWrKcnm
 lhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MzZO530+2CXxCdmaG5cz/gjiD6kJ7s8WrnI0bSV2iKM=;
 b=TcJI5Qy5poBG3RqIxiHk5DzUbXqadmgMp5hejYLg6h1Q2Pzr26nCTtZkWQPzaseaS8
 rC5og828nndmgYi/OydfYbQ+qQ1P3xc3v5xfCye58wcVDvSDegxkvBQF/IPxWbTk7eAL
 39p7kaDdKfo+KzncMPqxBcCW3kf89g8LhSAbd1Tnjq/6sF+P8sAe5vigsDbo+K05+FHa
 BTB2Strvj5elTdSlq8UdenDBje4Q+EOGO3vP3YxyRtfI0XwMnFj6sG1JH1tWtoxjbhkR
 gGjDDtFJ1nAgzXCuWS0baAHtA2T90bDIP+8PBj81AfneFKLeryA6kEgZUlO2d+r8CQiZ
 p+/A==
X-Gm-Message-State: AOAM533nqna/ucoMBqKJfM7OSni6s0HKez5OnlEMg+pfL7FJ1uZtJtLS
 iCipVAs8vuc2LAS45CgDyYf2kg==
X-Google-Smtp-Source: ABdhPJxW36mS5Hmc7Lkhmncsk+kIbxUZeapYQ+kzrWQzY76smVbVvRGllIiXjlQZxgW3tpeke7d55g==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr5745993wri.308.1637316085420; 
 Fri, 19 Nov 2021 02:01:25 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id o12sm2673490wmq.12.2021.11.19.02.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:01:24 -0800 (PST)
Subject: Re: [PULL 0/3] Net patches
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20211119040336.14460-1-jasowang@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <efd01ef9-8e80-9f98-1ab6-9e2188f2f454@linaro.org>
Date: Fri, 19 Nov 2021 11:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119040336.14460-1-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 5:03 AM, Jason Wang wrote:
> The following changes since commit 44a3aa0608f01274418487b655d42467c1d8334e:
> 
>    Merge tag 'sev-hashes-pull-request' of https://gitlab.com/berrange/qemu into staging (2021-11-18 15:06:05 +0100)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 0656fbc7ddccdade1709742a9b56ae07dd3c280a:
> 
>    net/colo-compare.c: Fix incorrect return when input wrong size (2021-11-19 11:44:22 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Prasad J Pandit (1):
>        net: vmxnet3: validate configuration values during activate (CVE-2021-20203)
> 
> Zhang Chen (2):
>        net/colo-compare.c: Fix ACK track reverse issue
>        net/colo-compare.c: Fix incorrect return when input wrong size
> 
>   hw/net/vmxnet3.c   | 13 +++++++++++++
>   net/colo-compare.c |  8 +++++---
>   2 files changed, 18 insertions(+), 3 deletions(-)

Applied, thanks.

r~

