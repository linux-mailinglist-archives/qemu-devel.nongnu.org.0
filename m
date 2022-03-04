Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287F4CD2F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:06:16 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5lH-0006AU-0b
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:06:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nQ5Z5-00063r-FR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:53:39 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nQ5Z3-0003sB-NM
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:53:39 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 86E422077D;
 Fri,  4 Mar 2022 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1646391215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/PiaqnET7CepG7cFLh9JdcXL4wLNL3o76qZD3HsF25Q=;
 b=ZD8CPAHg8+vK0siRvwGBv52WDHPvNGUc3ix3N3pXLBEjoHm4I1ct+NU8G/G/dYjz20DzHy
 /CV1eXtVlIcwJ9QJoJNS1haYlFc8fe2W0MzturYyPnurLS7GbEZ/KPObuMyOC3hEGbRNmk
 wA0M1axl8LO0LdVmgKKjUDKFUEu/JSM=
Message-ID: <892dad33-8883-1434-237c-d77ba549f04a@greensocs.com>
Date: Fri, 4 Mar 2022 11:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 11/14] softmmu/memory: add
 memory_region_try_add_subregion function
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-12-damien.hedde@greensocs.com>
 <bd6f884e-a150-88d8-4b8c-9ec76171b275@greensocs.com>
 <3f8f7c74-3f9c-c0b5-e009-c962fce08eba@gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <3f8f7c74-3f9c-c0b5-e009-c962fce08eba@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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




On 3/3/22 14:32, Philippe Mathieu-Daudé wrote:
> On 23/2/22 10:12, Damien Hedde wrote:
>> Hi Philippe,
>>
>> I suppose it is ok if I change your mail in the reviewed by ?
> 
> No, the email is fine (git tools should take care of using the
> correct email via the .mailmap entry, see commit 90f285fd83).
> 
>> Thanks,
>> Damien
>>

ok.

Looks like git keeps as-is the "*-by:" entries untouched when cc-ing them.

--
Damien

