Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C864530EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:18:30 +0200 (CEST)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt713-000605-9C
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nt6yJ-0002xy-CG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nt6yG-0002Rs-GD
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653308134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ba3S7XvZKlgqOC8q5mCc2RDYNkea0rXg1xHcbYWEmIc=;
 b=hRX98jartQgv5E33L3UWLSTX1V+SwIUNS6V91uzcBFPrHd4kKU/7RUXd/Pdt7ENYFZNEiG
 ZUm0EISintjzIakYgryHA+Pq+XGSRjt3EFpyXLU17kMJWg10vy97b96zMLTpkwwNz1vVVy
 PxcFCpu1inJ0VrKRs/70DZ4nSLH4nAY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-VvjgNifSO4CGYlA1C98Tmw-1; Mon, 23 May 2022 08:15:33 -0400
X-MC-Unique: VvjgNifSO4CGYlA1C98Tmw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a1c440b000000b00397335edc7dso5898043wma.7
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ba3S7XvZKlgqOC8q5mCc2RDYNkea0rXg1xHcbYWEmIc=;
 b=gzePi2WHqQp5O05C44AOcJ/l0Ju1CRXE76FKUY8mr0ST49umMgSyj9h+2UbIShufCi
 LfXaZVzgiJkkJzs/teMtnXPQ4qkG+7rXEisPUJ1J6lT6d35UghEiTntWT4AaSpE6ise1
 YSsb0wraN9XLnwcuVjdmb/HCJwFRXlJv0H6ZBmixXpPG95ZnTfEmGA2myhxdVMdcPOAF
 PQOb0fo1Mtn0BLTV9Qq5pVfNQW1dkJONFV43maNH1TXY3LGb0xgQlknsvbLopoZsxUYL
 mE4b9ncByD9d1mQEQdOkSTL5SFSVgs0woS6p138LnWcG3kDxzoRGSbp2CyKAB+kZLx82
 nJbg==
X-Gm-Message-State: AOAM530Ff3nsv4Uos90A5QR7FaeSujyLyj4MOv3kfc2po6pdKODnzsZO
 BfzOXPTYWUxL7dBw9AWnrZVWrozN2gTrRy4XcT6NJHoorhyC2fT3xsbvxb5sXQdEuacVX9urSDv
 7DxAUO0ucxGusM0Y=
X-Received: by 2002:a05:600c:209:b0:397:4a0f:7 with SMTP id
 9-20020a05600c020900b003974a0f0007mr5116065wmi.91.1653308132418; 
 Mon, 23 May 2022 05:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIaN+2SutCuPm879LVVBRWwB3m7CAj55tTpwlgdRwJJzPn/9frS8Cp8OCJFe9Zd9Dm1foecQ==
X-Received: by 2002:a05:600c:209:b0:397:4a0f:7 with SMTP id
 9-20020a05600c020900b003974a0f0007mr5116048wmi.91.1653308132238; 
 Mon, 23 May 2022 05:15:32 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-5.web.vodafone.de. [109.43.177.5])
 by smtp.gmail.com with ESMTPSA id
 ay28-20020a05600c1e1c00b003973c4bb19bsm7847276wmb.16.2022.05.23.05.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 05:15:31 -0700 (PDT)
Message-ID: <f614c7f6-2523-d587-ea44-fe4c70e8c630@redhat.com>
Date: Mon, 23 May 2022 14:15:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] capstone: Remove the capstone submodule
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-4-thuth@redhat.com>
 <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA8t37wT2D-tT0n0O2HP1sTtYfeS8p2Wd+4QE6jsJ0k9Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/05/2022 13.41, Peter Maydell wrote:
> On Mon, 16 May 2022 at 16:22, Thomas Huth <thuth@redhat.com> wrote:
>>
>> Now that we allow compiling with Capstone v3.05 again, all our supported
>> build hosts should provide at least this version of the disassembler
>> library, so we do not need to ship this as a submodule anymore.
> 
> When this eventually goes in, please remember to update the
> wiki changelog page's 'Build Information' section to let
> users know.

Done: https://wiki.qemu.org/ChangeLog/7.1#Build_Dependencies

  Thomas



