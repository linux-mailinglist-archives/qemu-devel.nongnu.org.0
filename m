Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C508053002D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 03:10:05 +0200 (CEST)
Received: from localhost ([::1]:36672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsa6e-00058W-Eq
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 21:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsa4K-0003oN-Ue
 for qemu-devel@nongnu.org; Sat, 21 May 2022 21:07:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsa4J-0002Sk-7v
 for qemu-devel@nongnu.org; Sat, 21 May 2022 21:07:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c14so10744321pfn.2
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=YZq0yiv3/zQootdX6oKs5HIpFRNpMv3IoPcLNB+EHbI=;
 b=HEvrPJRRlthQCgLMCIhRMDzGeFqtKZK0hxD9p83Q5XuLnI+LRY3l9MylbYE3+MKYwC
 nY/BCo/Te4VA1dfx8wWW42O7rLtPCOqGCEzJ9nU+5K+ypINDAyRb04Y21tr++149V/Sd
 3l0NGGywb8W/3bF2nG8/UpMisPbAkLZXE4cN7BIqkxl+TK9/6P9RhUtKpbTS5/MqNlKu
 okIsWxHkAJTUt4rEhHHR02Ox+yeoDbmHU2EhOVDx5+QECjkx6p9SdJClYJb8BDavAk/Q
 qJEPHDGx0XwkEoBvL92UcLnhaEgGuuwkh3z4z+kyRvBkPAjGSRfdpgkDDP1aDXA1NKOs
 5FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YZq0yiv3/zQootdX6oKs5HIpFRNpMv3IoPcLNB+EHbI=;
 b=RixmaPE5ppEEiMtMgyQusKA6CE+TGdV0FooublY3nM6BnMuc1Ii2RgEidalNFqjQyB
 gHnxCOoaeOxnIAKbVdXwb4b+HDVleSYJC0JIyvj7T4odXfmPIf/SPow4l33lXDu31iF4
 CTRiPTpPEBiPp2pWSnfBrH5rGnOCliDnon82WC1AVMBc2a6dxPs/d+dN2W2j+LJcGfZ2
 O3TWt3BhuXS4h2ar1oLrl6/WiI67PLpiIRQg3k/ncMbxiRYdbvXgci3l/38bpx1y0L8F
 dPSvkL53zFLf4HkotMWVJJ/5JdxHcXuJyvOgggK+BHBE7dLMUA3nJzfXc4c/elSzq3ww
 DXAw==
X-Gm-Message-State: AOAM532n8sLQWT3Y0rHTkOJ9Jg4uROpzXuo1p1mo5S9+HqqSh48iv8QR
 AxSsl8O7Vw9xuVzAEk/0eEhS3Q==
X-Google-Smtp-Source: ABdhPJxDPsd5yn55Ik9xg05vrK9uVuIMdQVD7bxWbitsajBQsJk28r1JELDk/UiCXNkcjgm5/+gS0Q==
X-Received: by 2002:a63:dd57:0:b0:3f6:44f:9d72 with SMTP id
 g23-20020a63dd57000000b003f6044f9d72mr15135128pgj.62.1653181655990; 
 Sat, 21 May 2022 18:07:35 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a170902d4c200b0016168e90f2csm2166193plg.208.2022.05.21.18.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 18:07:35 -0700 (PDT)
Message-ID: <37f4c866-4344-37ba-b64b-fd338dc96887@linaro.org>
Date: Sat, 21 May 2022 18:07:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Emulating CPUs with larger atomic accesses
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>, qemu-devel@nongnu.org
References: <87k0apeor5.fsf@oldenburg.str.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87k0apeor5.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/13/22 03:00, Florian Weimer wrote:
> What's QEMU's approach to emulating CPU instructions that atomatically
> operate on values larger than what is supported by the host CPU?
> 
> I assume that for full system emulation, this is not a problem, but
> qemu-user will not achieve atomic behavior on shared memory mappings.
> How much of a problem is this in practice?

Well, it doesn't work, no.  In practice, x86_64 supports 128-bit atomic operations, and 
guest requires more than that.  No one really cares anymore about 32-bit hosts with 
smaller atomic operations.


r~

