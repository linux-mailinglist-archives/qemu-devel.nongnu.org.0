Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711B3491123
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:54:21 +0100 (CET)
Received: from localhost ([::1]:45562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Z1A-0004hm-HK
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:54:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Yx7-0002Dc-QR; Mon, 17 Jan 2022 15:50:14 -0500
Received: from [2607:f8b0:4864:20::336] (port=43777
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n9Yx5-0007sN-Ir; Mon, 17 Jan 2022 15:50:09 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 q13-20020a9d4b0d000000b0059b1209d708so887095otf.10; 
 Mon, 17 Jan 2022 12:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EdJC2y5kVsIzq0vzgu68mv/a/j19cMbW128nAHz8Ees=;
 b=afsfPXV3s5G829SawwbJEJw4HPhxWyh/NErTZ1JUZ+eQPkXQZoRKh4M/xfBGmNFck0
 KW/EkOsjbmV6zeJcb/A8YGjO/F5xjey9n4EEEctSt7f+dhLSrPLNiTPL6xsdyT1d9kVH
 6Uxg/j3ShVKTVgzIpoF2lhV09N15U/2gUK9h8gEayxKfVBvQe2TCEGVU3UguP8nnfmdf
 KKdSD7mDqZZOxlqChk/Il6JYRKAIy5+k0hnkjSw4hz8s36n8zfQAdAUJSGEhM0EofiG3
 sWNWk+3naUxRYscjggRIR8edhm16XzKZ906aVzu3EOiMloMG0PCpdBjXjmEsBQwFE0p4
 Ak6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EdJC2y5kVsIzq0vzgu68mv/a/j19cMbW128nAHz8Ees=;
 b=mbatQlGTuoxbxk4F1srtVBlsmGd2zlabI3h4/HOaBJWBq4UjTxQ7OeZNDOqYdxTDmX
 5IMcq16JACptvx5eLKxfWNbjxJAwHbzMM73lM168iEvPUpSU3Vd7yRsubXjY4E9tj490
 Tniw2tlQ3bOQobIqN3PKLqjjLvbwAcULEu3qGWAWxw15QS9bwKIyGt2w9yz1rOdkTxEl
 8fS8kH1VK8HPDze4YIg+qt2gfIjflZqvv4v7LkNmvasjLemNZVAX2qS/5biwb20Ce/Sr
 4KmpK4Bj2INlSd/2ZlxwyRXpPAJQ1Fc8DF5/VtEkaZ7xBCRKKCc1bZwe/2IQJ8NyhX7F
 uJeA==
X-Gm-Message-State: AOAM531qHd/bXTauX2U+OxuRhoVm0mPUNbHCWRS5Lc9PHqTrqXfYC2C6
 MkPz/uPd4m0rg/VICbYsL0Y=
X-Google-Smtp-Source: ABdhPJwcLPYrrlJ6/E5+yPtD9Fggd3Ia5bXmztnIz8OJu9gbH54RuNKEQFHK9A8mekHa0LzqnIy40A==
X-Received: by 2002:a9d:24a2:: with SMTP id z31mr17531206ota.216.1642452606094; 
 Mon, 17 Jan 2022 12:50:06 -0800 (PST)
Received: from [192.168.10.222] ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id t22sm6109271otp.52.2022.01.17.12.50.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 12:50:05 -0800 (PST)
Message-ID: <0c9b2b83-d1da-0191-d53e-b635e1aff621@gmail.com>
Date: Mon, 17 Jan 2022 17:50:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] rSTify ppc-spapr-uv-hcalls.txt.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1642446868.git.lagarcia@br.ibm.com>
 <243a714d3861f7539d29b02a899ffc376757d668.1642446876.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <243a714d3861f7539d29b02a899ffc376757d668.1642446876.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/22 16:19, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/specs/ppc-spapr-uv-hcalls.txt | 165 ++++++++++++++++-------------
>   1 file changed, 89 insertions(+), 76 deletions(-)
> 
> diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv-hcalls.txt
> index 389c2740d7..a00288deb3 100644
> --- a/docs/specs/ppc-spapr-uv-hcalls.txt
> +++ b/docs/specs/ppc-spapr-uv-hcalls.txt
> @@ -1,76 +1,89 @@
> -On PPC64 systems supporting Protected Execution Facility (PEF), system
> -memory can be placed in a secured region where only an "ultravisor"
> -running in firmware can provide to access it. pseries guests on such
> -systems can communicate with the ultravisor (via ultracalls) to switch to a
> -secure VM mode (SVM) where the guest's memory is relocated to this secured
> -region, making its memory inaccessible to normal processes/guests running on
> -the host.
> -
> -The various ultracalls/hypercalls relating to SVM mode are currently
> -only documented internally, but are planned for direct inclusion into the
> -public OpenPOWER version of the PAPR specification (LoPAPR/LoPAR). An internal
> -ACR has been filed to reserve a hypercall number range specific to this
> -use-case to avoid any future conflicts with the internally-maintained PAPR
> -specification. This document summarizes some of these details as they relate
> -to QEMU.
> -
> -== hypercalls needed by the ultravisor ==
> -
> -Switching to SVM mode involves a number of hcalls issued by the ultravisor
> -to the hypervisor to orchestrate the movement of guest memory to secure
> -memory and various other aspects SVM mode. Numbers are assigned for these
> -hcalls within the reserved range 0xEF00-0xEF80. The below documents the
> -hcalls relevant to QEMU.
> -
> -- H_TPM_COMM (0xef10)
> -
> -  For TPM_COMM_OP_EXECUTE operation:
> -    Send a request to a TPM and receive a response, opening a new TPM session
> -    if one has not already been opened.
> -
> -  For TPM_COMM_OP_CLOSE_SESSION operation:
> -    Close the existing TPM session, if any.
> -
> -  Arguments:
> -
> -    r3 : H_TPM_COMM (0xef10)
> -    r4 : TPM operation, one of:
> -         TPM_COMM_OP_EXECUTE (0x1)
> -         TPM_COMM_OP_CLOSE_SESSION (0x2)
> -    r5 : in_buffer, guest physical address of buffer containing the request
> -         - Caller may use the same address for both request and response
> -    r6 : in_size, size of the in buffer
> -         - Must be less than or equal to 4KB
> -    r7 : out_buffer, guest physical address of buffer to store the response
> -         - Caller may use the same address for both request and response
> -    r8 : out_size, size of the out buffer
> -         - Must be at least 4KB, as this is the maximum request/response size
> -           supported by most TPM implementations, including the TPM Resource
> -           Manager in the linux kernel.
> -
> -  Return values:
> -
> -    r3 : H_Success    request processed successfully
> -         H_PARAMETER  invalid TPM operation
> -         H_P2         in_buffer is invalid
> -         H_P3         in_size is invalid
> -         H_P4         out_buffer is invalid
> -         H_P5         out_size is invalid
> -         H_RESOURCE   problem communicating with TPM
> -         H_FUNCTION   TPM access is not currently allowed/configured
> -    r4 : For TPM_COMM_OP_EXECUTE, the size of the response will be stored here
> -         upon success.
> -
> -  Use-case/notes:
> -
> -    SVM filesystems are encrypted using a symmetric key. This key is then
> -    wrapped/encrypted using the public key of a trusted system which has the
> -    private key stored in the system's TPM. An Ultravisor will use this
> -    hcall to unwrap/unseal the symmetric key using the system's TPM device
> -    or a TPM Resource Manager associated with the device.
> -
> -    The Ultravisor sets up a separate session key with the TPM in advance
> -    during host system boot. All sensitive in and out values will be
> -    encrypted using the session key. Though the hypervisor will see the 'in'
> -    and 'out' buffers in raw form, any sensitive contents will generally be
> -    encrypted using this session key.
> +===================================
> +Hypervisor calls and the Ultravisor
> +===================================
> +
> +On PPC64 systems supporting Protected Execution Facility (PEF), system memory
> +can be placed in a secured region where only an ultravisor running in firmware
> +can provide access to. pSeries guests on such systems can communicate with
> +the ultravisor (via ultracalls) to switch to a secure virtual machine (SVM) mode
> +where the guest's memory is relocated to this secured region, making its memory
> +inaccessible to normal processes/guests running on the host.
> +
> +The various ultracalls/hypercalls relating to SVM mode are currently only
> +documented internally, but are planned for direct inclusion into the Linux on
> +Power Architecture Reference document ([LoPAR]_). An internal ACR has been filed
> +to reserve a hypercall number range specific to this use case to avoid any
> +future conflicts with the IBM internally maintained Power Architecture Platform
> +Reference (PAPR+) documentation specification. This document summarizes some of
> +these details as they relate to QEMU.
> +
> +Hypercalls needed by the ultravisor
> +===================================
> +
> +Switching to SVM mode involves a number of hcalls issued by the ultravisor to
> +the hypervisor to orchestrate the movement of guest memory to secure memory and
> +various other aspects of the SVM mode. Numbers are assigned for these hcalls
> +within the reserved range ``0xEF00-0xEF80``. The below documents the hcalls
> +relevant to QEMU.
> +
> +``H_TPM_COMM`` (``0xef10``)
> +---------------------------
> +
> +SVM file systems are encrypted using a symmetric key. This key is then
> +wrapped/encrypted using the public key of a trusted system which has the private
> +key stored in the system's TPM. An Ultravisor will use this hcall to
> +unwrap/unseal the symmetric key using the system's TPM device or a TPM Resource
> +Manager associated with the device.
> +
> +The Ultravisor sets up a separate session key with the TPM in advance during
> +host system boot. All sensitive in and out values will be encrypted using the
> +session key. Though the hypervisor will see the in and out buffers in raw form,
> +any sensitive contents will generally be encrypted using this session key.
> +
> +Arguments:
> +
> +  ``r3``: ``H_TPM_COMM`` (``0xef10``)
> +
> +  ``r4``: ``TPM`` operation, one of:
> +
> +    ``TPM_COMM_OP_EXECUTE`` (``0x1``): send a request to a TPM and receive a
> +    response, opening a new TPM session if one has not already been opened.
> +
> +    ``TPM_COMM_OP_CLOSE_SESSION`` (``0x2``): close the existing TPM session, if
> +    any.
> +
> +  ``r5``: ``in_buffer``, guest physical address of buffer containing the
> +  request. Caller may use the same address for both request and response.
> +
> +  ``r6``: ``in_size``, size of the in buffer. Must be less than or equal to
> +  4 KB.
> +
> +  ``r7``: ``out_buffer``, guest physical address of buffer to store the
> +  response. Caller may use the same address for both request and response.
> +
> +  ``r8``: ``out_size``, size of the out buffer. Must be at least 4 KB, as this
> +  is the maximum request/response size supported by most TPM implementations,
> +  including the TPM Resource Manager in the linux kernel.
> +
> +Return values:
> +
> +  ``r3``: one of the following values:
> +
> +    ``H_Success``: request processed successfully.
> +
> +    ``H_PARAMETER``: invalid TPM operation.
> +
> +    ``H_P2``: ``in_buffer`` is invalid.
> +
> +    ``H_P3``: ``in_size`` is invalid.
> +
> +    ``H_P4``: ``out_buffer`` is invalid.
> +
> +    ``H_P5``: ``out_size`` is invalid.
> +
> +    ``H_RESOURCE``: problem communicating with TPM.
> +
> +    ``H_FUNCTION``: TPM access is not currently allowed/configured.
> +
> +    ``r4``: For ``TPM_COMM_OP_EXECUTE``, the size of the response will be stored
> +    here upon success.

