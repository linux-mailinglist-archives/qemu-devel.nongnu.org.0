Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E463EE33
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 11:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0h2D-0008RV-2d; Thu, 01 Dec 2022 05:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h28-0008R8-Ba
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:43:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h26-0000aW-Hd
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 05:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fhu5EftvXp6YQ+2nCom+I4Ef+dn6GuMXplmkUv+gAds=; b=R/aNr11nspbNP8RCvLsd27b4Xe
 g5IuRp/K4vUe8wfKGyv9aJ0aBX1kVN5O3PU6CalNNw0LUQMR/Dmn6zFVphczfbWJXdDnt4iE3G6fe
 uFvQIyrmrMTSPAuuqG1RtJheWuGLFvHz0qM1W/Xz4wkAJrTK1trEJ2KfhmVmHEtz4KJqEC4YkCFWz
 QxvRWde+zpyFqGHrZwDBzYEdmvFQ+hcKsWw6lVK91Li5XUzVgbrsdxmMXvIcd9RaSpU+4qpOO8TUR
 0ybAjOjjrND0uHzdAFrc4+EU/jWkjSF9pCbB219RAI90rmTfHaRApzs836LCvXxRJoSsDbxIQQ287
 2pkxb4XoiNqbWmEj0xM1bKz+AtJ8sUQPVvXUmsG8JhyoFzbVv8d/7ZQ8sSWTAYj8ZmwYQKVN+NB8P
 dgxEFehUgq8PNeGLZAL/KlpK2y58ZBVgrATxscqIwQvVGOhwkHzPCLuZw+X488C4n+VmM+CWKhyxU
 N0cLL7zzi1/D03k0nKgKEG6L8IcpCVDNZYQFM2Cckb3PVpXJt8aAJMexCPmIdL77RfMFUSSuqW3rn
 l5XOutZgisQIWN+Gptm4Ho3DYAjogyu1dP66XkRIybE4O85FYTWcVPzck4JHO+CfTSpH7A/P52mM8
 jJmUkH+SbLPCNY/C6hygofjG/Toni64DNTa+27LQw=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p0h1k-0002yN-4w; Thu, 01 Dec 2022 10:42:52 +0000
Message-ID: <79d6d8e3-7fd7-4e8e-5eee-da47e2cb81bf@ilande.co.uk>
Date: Thu, 1 Dec 2022 10:42:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20221130100434.64207-1-mark.cave-ayland@ilande.co.uk>
 <20221130100434.64207-2-mark.cave-ayland@ilande.co.uk>
 <87iliw1dh5.fsf@suse.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <87iliw1dh5.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 1/1] tcg: convert tcg/README to rst
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/2022 18:52, Fabiano Rosas wrote:

> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> 
>> Convert tcg/README to rst and move it to docs/devel as a new "TCG Intermediate
>> Representation" page. There are a few minor changes to improve the aesthetic
>> of the final output which are as follows:
>>
>>    - Rename the title from "Tiny Code Generator - Fabrice Bellard" to "TCG
>>      Intermediate Representation"
>>
>>    - Remove the section numbering
>>
>>    - Add the missing parameters to the ssadd_vec operations in the "Host
>>      vector operations" section
>>
>>    - Change the path to the Atomic Operations document to use a proper
>>      reference
>>
>>    - Replace tcg/README in tcg.rst with a proper reference to the new document
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>

Thanks!

> I have a couple of suggestions for a small restructuring. But we could
> do that after this patch gets in, no worries.
> 
> The index now looks like:
> 
> Translator Internals           <--- mentions what TCG stands for
>      CPU state optimisations    <--- references TBs and targets
>      Direct block chaining
>      Self-modifying code and...
>      Exception support
>      MMU emulation
> 
> TCG Intermediate Representation  <--- duplicate section name (see below)
>      Introduction                 <--- 2nd time we mention what TCG stands for
>      Definitions                  <--- defines TBs and targets
>      Intermediate representation  <--- duplicate section name
>      Instruction Reference
>      Backend
>      Recommended coding rules for best performance
> 
> I think it would be nicer to merge the text from "Introduction" with the
> paragraph that mentions TCG in "Translator Internals" instead of
> linking;
> 
> and moving the whole "Definitions" section to before "CPU state
> optimizations". That way we keep the definitions before the text that
> mentions the terms and remove the duplicate "intermediate
> representation" in the index.

I don't have a great deal of time in the short term, but I agree the documentation 
can be further improved once the patch has been merged. At least once the conversion 
is done, it allows for others to come up with subsequent patches as time allows :)


ATB,

Mark.

