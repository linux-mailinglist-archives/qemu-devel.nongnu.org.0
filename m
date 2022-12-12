Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C736649B62
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 10:42:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4fJf-0001ZJ-4s; Mon, 12 Dec 2022 04:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4fJd-0001Yx-5G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:41:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4fJb-0007Ss-A6
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 04:41:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id q7so11433194wrr.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 01:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Qsewi+DCF7zklyg/Jsvv7vPTfaqMDt0yPiH+bSo6XE=;
 b=ZXREA+7MNPpAsxrqK8MT+AzAc6mNu9BsFHTPAvam0zlP+DY1xJxj5nfIVHR3C3uFXB
 12GRDUK6bDwD4muAp77wz/kzCyVoGGemb+gx66Jdy2c114r4B5fNFbI94rIjKep43EMr
 leYFTFdPoOq54r4v1d28/cQIw0C9/zkYDw4xy6/Ak6fPWklUwLPZJ2DmTYDhpu4nxmSO
 toQ2nl79uurd9r5JcyX4z6WIBvfZDpmELMMax45ZgMEYlJkoCi6MkhK+e5Z31cjGN4dQ
 FJdcaxwolHsjqAqeUMNUQYg/ojESekRrswOpKh56HnSKVFLx2gth2sAZk97JvHWXGMlW
 /KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Qsewi+DCF7zklyg/Jsvv7vPTfaqMDt0yPiH+bSo6XE=;
 b=PeDUpyr228fT/blM6x+nwOuj8+Cu3fhcB0IvOHsQA6CJDaBjq6l4FxBpqhMqas9P3u
 mT7UGwHCKCO2iOynYTh56L9jphOcLWOdlrROONQ/dLYyN08Kgy6P0KhW1W2vdWYZzwd+
 Pj6Hwwh5Ba7sm9/OsENKZBcuuRw390rKqTE9qdRwh14hx749WuBqn8NUEVhnxiQ7Sb2X
 IfVi8dvMt66fK6/87brh9tD59+AGcdDGRzHuywLXAxiwn5tBQCdJL/Dip4nQOQWOXCNU
 JHhtPkEgBMweQhdM2UuhBCNGW43uoIjo0y0tbHGAoHIG9ZI4NCS11of4334LPNsnemGY
 p5KQ==
X-Gm-Message-State: ANoB5plzq9caPy3EYs+Hm3tb5UBP2Y9ngeGTdjXEBJ+175dbwS4T2LTa
 XRpUV/ZU8urLmATwUZOVcS5j9g==
X-Google-Smtp-Source: AA0mqf7drWs9V77G8KKyOO076U6TUL9YBKaVdEE9HSympXANLp1wmAd3C/tEu3oUAIc12eTfM/iVpA==
X-Received: by 2002:a5d:4481:0:b0:232:be5a:f580 with SMTP id
 j1-20020a5d4481000000b00232be5af580mr11992907wrq.10.1670838097473; 
 Mon, 12 Dec 2022 01:41:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h20-20020adfaa94000000b002367ad808a9sm8378085wrc.30.2022.12.12.01.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 01:41:37 -0800 (PST)
Message-ID: <4bc3f966-63d2-6dcd-bcbb-7f95306c7b3b@linaro.org>
Date: Mon, 12 Dec 2022 10:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v1 00/24] vfio-user client
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
Cc: Mark Burton <mburton@qti.qualcomm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Cc'ing Mark & Edgar.

On 9/11/22 00:13, John Johnson wrote:
> Hello,
> 
> This is the 6th revision of the vfio-user client implementation.
> It is the first patch series (the previous revisions were RFCs)
> 
> First of all, thank you for your time reviewing the RFC versions.
> 
> The vfio-user framework consists of 3 parts:
>   1) The VFIO user protocol specification.
>   2) A client - the VFIO device in QEMU that encapsulates VFIO messages
>      and sends them to the server.
>   3) A server - a remote process that emulates a device.
> 
> This patchset implements parts 1 and 2.
> 
> The libvfio-user project (https://github.com/nutanix/libvfio-user)
> can be used by a remote process to handle the protocol to implement the third part.
> We also have upstreamed a patch series that implement a server using QEMU.
> 
> 
> Contributors:
> 
> John G Johnson <john.g.johnson@oracle.com>
> John Levon <john.levon@nutanix.com>
> Thanos Makatos <thanos.makatos@nutanix.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Jagannathan Raman <jag.raman@oracle.com>
> 
> John Johnson (23):
>    vfio-user: add VFIO base abstract class
>    vfio-user: add container IO ops vector
>    vfio-user: add region cache
>    vfio-user: add device IO ops vector
>    vfio-user: Define type vfio_user_pci_dev_info
>    vfio-user: connect vfio proxy to remote server
>    vfio-user: define socket receive functions
>    vfio-user: define socket send functions
>    vfio-user: get device info
>    vfio-user: get region info
>    vfio-user: region read/write
>    vfio-user: pci_user_realize PCI setup
>    vfio-user: get and set IRQs
>    vfio-user: forward msix BAR accesses to server
>    vfio-user: proxy container connect/disconnect
>    vfio-user: dma map/unmap operations
>    vfio-user: add dma_unmap_all
>    vfio-user: secure DMA support
>    vfio-user: dma read/write operations
>    vfio-user: pci reset
>    vfio-user: add 'x-msg-timeout' option that specifies msg wait times
>    vfio-user: add coalesced posted writes
>    vfio-user: add trace points



