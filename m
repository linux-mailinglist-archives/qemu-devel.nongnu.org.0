Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D804E9F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 20:56:38 +0200 (CEST)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYuXc-0005Iz-Op
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 14:56:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYuWb-0004VX-BN
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:55:33 -0400
Received: from [2607:f8b0:4864:20::32a] (port=46045
 helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYuWY-00088m-Nm
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 14:55:32 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso11291480otf.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=p4JUa8oL3t3x6DvZp3qV+yS2dqmaqEdju7DDKzmuyO8=;
 b=jbgdoRrEiIssshp66/INIaN59tjgtijF+p2N2jrdTK2USnjFkTJdF3dzfog3BJ1cCU
 GQ5HkUj8N0JckJ2ZknWtw8QW/uFXYCLw5RQVA6z1b7vJqG0mlHLKs0YR7yg1hhtxDijc
 shr6l2iAf1RfAwEBo+EiDhLXWrpSAPDHTNqjiOczZnjj8r0HJbG3n78UgJP2qeikiWEv
 ICsBfU4FpcxxaJMYuRzq7VLe2x2yLdpkjNr+Z4zIQnb8PoJvjCy9lFzw6apmj9u1OpY0
 paAbFP9qg1ozTW2TgkXHtsc+FTwH/o9S5VAUUvRL/mYTDrB4UqGuS7e8WzHrRtjN8Juy
 bj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p4JUa8oL3t3x6DvZp3qV+yS2dqmaqEdju7DDKzmuyO8=;
 b=LOMEXeGcm5aJnasXX3Gg6ljdX0lfZnhc307bbgPc4PRhrOe/zk1KLUKXRxqgqZbeRO
 pA8/iiYZBks0kUh6EbzWL8GikRCCjDr+Eig8WNkrrWKrzuoyYG0J8sQrbys6FFIXzsiy
 9RTI/o124cjBWIUCpdS9nagnPR0AnZiEAfDshS/XKiNTIHAV3GVzBFIPZsaNzndCYmba
 /a2kprqZAa5k2Zt80Hz9fh9IaPgYt3ed4OlwUMmYL4KXBXB5g5fDDJZmQFa3hMNjQqyr
 xgEpsRmwrakSAAvXTwjhXcu15VA+o2tyDcbD5GZgIOrtRr6sI+l8YZbQB3hquV+2aCGN
 sBzQ==
X-Gm-Message-State: AOAM533V+P33hLw+RPs/ThUMS7qYWKc+Z46yRh8wl3s8oY21IM/3fuLJ
 F4E8cfqq2fpv4g4RtJWgtTMHqScBQVrwbmXFVnM=
X-Google-Smtp-Source: ABdhPJxmwOVftvIG+Pit145vfVSO7gGLQfcM2Pjdk/Iq0uDfYwQryWBGk5m7xj9/E1GLSAh4w11uow==
X-Received: by 2002:a05:6830:1018:b0:5b2:2cc8:4b0c with SMTP id
 a24-20020a056830101800b005b22cc84b0cmr10447387otp.136.1648493727250; 
 Mon, 28 Mar 2022 11:55:27 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c12-20020a9d75cc000000b005b24b061940sm7496749otl.33.2022.03.28.11.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 11:55:26 -0700 (PDT)
Message-ID: <05fbe6bd-723e-5cb6-5dc7-b7def4df7ec1@linaro.org>
Date: Mon, 28 Mar 2022 12:55:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 08/29] target/loongarch: Add LoongArch IOCSR
 instruction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-9-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-9-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +uint64_t helper_iocsr_read(CPULoongArchState *env, target_ulong r_addr,
> +                           uint32_t size)
> +{
> +    int cpuid = env_cpu(env)->cpu_index;
> +    CPUState  *cs = qemu_get_cpu(cpuid);
> +    env = cs->env_ptr;
> +    uint64_t ret;
> +
> +    /*
> +     * Adjust the per core address such as 0x10xx(IPI)/0x18xx(EXTIOI)
> +     */
> +    if (((r_addr & 0xff00) == 0x1000) || ((r_addr & 0xff00) == 0x1800)) {
> +        r_addr = r_addr + ((target_ulong)(cpuid & 0x3) << 8);
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        ret = address_space_ldub(&env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 2:
> +        ret = address_space_lduw(&env->address_space_iocsr, r_addr,
> +                                 MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 4:
> +        ret = address_space_ldl(&env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    case 8:
> +        ret = address_space_ldq(&env->address_space_iocsr, r_addr,
> +                                MEMTXATTRS_UNSPECIFIED, NULL);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return ret;
> +}

You should have seen an uninitialized use of 'ret' here.
The default case should be g_assert_not_reached().
And the same in helper_iocsr_write.


r~

