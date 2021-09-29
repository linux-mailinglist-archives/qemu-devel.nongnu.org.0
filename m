Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB0941C67E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:16:26 +0200 (CEST)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaNk-0003jH-VM
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVaGW-0003rE-IL; Wed, 29 Sep 2021 10:08:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVaGV-00060c-4u; Wed, 29 Sep 2021 10:08:56 -0400
Received: by mail-wr1-x432.google.com with SMTP id h15so2898508wrc.3;
 Wed, 29 Sep 2021 07:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=svrRv0XyORDGMpmxqjDfblXW/06vbWjyctuzECFZxVc=;
 b=KEbI4PpdnAJAkEhASUh8fCyioDUJeeYjO22/5kk/gatLjuXW2OxtvD/AjI6uTjaFyN
 FjzjclyiiY9TMN16LTjgVhEuzB0kox5zR9JR4PvdEaHKdLTCb1t8PTMFxbLq78UDYv+w
 Elz9zkyuWecQ1uFDxDmKjqZObiRDqiZErBmfY0zosgnHetBVwM7WFz7Rt6Byi3qJ5qsg
 L8yZeaFNNEyrntxLtuG0REhcjG4W3n43/cQkP8psgG7eRDkVsnpE7/etHtGEwxN+5CAs
 wNJydd9qzUOtr3D9ZGPiARe1jJxbqYs05oJYOnaISQv99y7pGGnO39OmwzrDFF48ZzFv
 FIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=svrRv0XyORDGMpmxqjDfblXW/06vbWjyctuzECFZxVc=;
 b=GKTbHpt7e4ZtyzpYP6a8v9cIVLDZREt4HPZVQL2UuZquczYNZRMu8X0gPudnF6ec97
 tV5Q3rcBfKNHc1Rc0fQ/MHLeJxNCdCYIop4Yl8ctq4Fc987Cw3p0aUBVuqtdkBXeSWve
 RtaVQuLVBT60GbPfvx4IF6soKsAexYkU/YFraNQwQ3S/LM4RJ8VlPqHE0qWsSTRpPTyE
 uWkk4XqldoWvsAZwsvZFdTMpftAVb+wkA6ttBLHbvHKNEBoOqA6sN9z2wJqxaSqgXHTj
 OQJOR7l9zINvfm0ywOpob2zDuF99IYYP5mntTCCNccRrizT6N6HIJoxelZoJqn7yxjT2
 VHdg==
X-Gm-Message-State: AOAM5335KregSufHdPI+Or6+qS1zWoSgJ3ECkL5plMZmwJ4RTezVTLPM
 giaIDx1wX+vZ7g+0YMafN2c=
X-Google-Smtp-Source: ABdhPJyUuoHPR12MezR6X6ntcJJfVDokKgmpmb7Urrbyc4KG85LZAUTxqECeJeX8e27uWsnNYbnByQ==
X-Received: by 2002:a05:6000:8e:: with SMTP id m14mr12308wrx.308.1632924533309; 
 Wed, 29 Sep 2021 07:08:53 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s2sm25097wru.3.2021.09.29.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 07:08:52 -0700 (PDT)
Message-ID: <f3e89488-0d05-657a-34f7-060a7250517d@amsat.org>
Date: Wed, 29 Sep 2021 16:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] target/i386: Include 'hw/i386/apic.h' locally
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210902152243.386118-1-f4bug@amsat.org>
 <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a4cba848-e668-7cf1-fe93-b5da3a4ac6dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Colin Xu <colin.xu@intel.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 00:05, Paolo Bonzini wrote:
> On 02/09/21 17:22, Philippe Mathieu-Daudé wrote:
>> Instead of including a sysemu-specific header in "cpu.h"
>> (which is shared with user-mode emulations), include it
>> locally when required.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thank you, Cc'ing qemu-trivial@ :)

