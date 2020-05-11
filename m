Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E41CD98A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 14:22:06 +0200 (CEST)
Received: from localhost ([::1]:55130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY7Rd-0007Ly-NX
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 08:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY7PS-0005ni-2Z
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:19:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33725
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY7PR-0001rX-78
 for qemu-devel@nongnu.org; Mon, 11 May 2020 08:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589199588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLyMEMUtWWHmGTQnNne8rTCXzLtrmwfee1Jte6/N6K4=;
 b=ZGlRATDOCnkCxUz7M9qdkIDqfhJmqlB3OowXwBGzMK2XnT1P+F7RwLt3hfYkTyPbXputiF
 7hgmC5m5eUvY/It+5b3kkI+UbNQ7wHLjiDojHh+MZaGpwYHiVx6wlh0Q0deMB51KbndXQ0
 uHh1jkZiLMlGRs+SLcQSUo7uPCxr1V0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-2VHqtH36PcqcnnAocvf0Iw-1; Mon, 11 May 2020 08:19:45 -0400
X-MC-Unique: 2VHqtH36PcqcnnAocvf0Iw-1
Received: by mail-wr1-f69.google.com with SMTP id r14so4857524wrw.8
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 05:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLyMEMUtWWHmGTQnNne8rTCXzLtrmwfee1Jte6/N6K4=;
 b=JzyJLKv8HJHy+e/ljSa8vA9Fzs6+GlCvs4iZD8Xd+5mofmRMerOH4gNj3FRPGVCeUY
 NoAdBtWuU2JapmtvEV7jLF6tk5zU67dtY3hA9Ox12jkIkaXHj1CQhN/jJvndU0+SvBn1
 cLveEw0VY9yrY54fiMjN44Q+KiKpuzzmnD/YPR32yMvxD0p1/mrl66c2M7Wql4Z/QXN1
 Dz0yLrjTx7n40ZWUd0f7HiP/K3Jyyp948P3V2076xU7TbFLF9yCNGvJVlRQtqYi59Ssp
 C32lPZtv/xXCknyb50WtHWAkZs2crLgshaQ/oWnYtyVTOFNPSE2Tu2emBAV+pXopW2SO
 wE+Q==
X-Gm-Message-State: AGi0PuY1UquztZ6Om4NBIMwOji9t0NC9ZWEcS+PSCcn4YsIYlEJFUq7Z
 T8qnkoAPAEHRCvsC5w42h5Wbg0IewJJBNvSDmdadrc3GVGzAGAOeptz/Fh67t3DXUBlY0bq3hNa
 aAtG7ITd8NVWa5yM=
X-Received: by 2002:a5d:534e:: with SMTP id t14mr18431979wrv.15.1589199584136; 
 Mon, 11 May 2020 05:19:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypLWGW6fFeYjOfqU400XpGi5EvUA65zDgYsmAbUloKHp0iWsgUDz4G5vtDJptLsuYIo4kX0B/w==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr18431959wrv.15.1589199583962; 
 Mon, 11 May 2020 05:19:43 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id a12sm16995644wro.68.2020.05.11.05.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 05:19:43 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] target/arm: Restrict TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200504172448.9402-1-philmd@redhat.com>
 <CAFEAcA_kV8HzHv3xuPRPMKC4JwH8BDfskWqwtDJ=tHMVt0i_Gg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bacd7700-9890-5685-3022-370e4490a5ce@redhat.com>
Date: Mon, 11 May 2020 14:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kV8HzHv3xuPRPMKC4JwH8BDfskWqwtDJ=tHMVt0i_Gg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/20 12:48 PM, Peter Maydell wrote:
> On Mon, 4 May 2020 at 18:24, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> These are the uncontroversial patches from "Support disabling
>> TCG on ARM (part 2)"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>>
>> The other patches are blocked by the "accel: Allow targets to
>> use Kconfig" series:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
>>
>> Patch #4 is new "Restrict v8M IDAU interface to Aarch32 CPUs".
>>
>> Since v2:
>> - Fixed set_feature() clash trying to KISS
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg697523.html
>> - Fixed aarch64-linux-user build failure reported by Peter:
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg699319.html
>>
>> Since v1:
>> - Dropped 'Make set_feature() available for other files' patch
>>    which fails to build with KVM only, see:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html
>>
>> Many thanks to Richard Henderson for his patience (again...)!
> 
> 
> 
> Applied to target-arm.next, thanks.

Thanks :)

> 
> -- PMM
> 


