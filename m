Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A84D9B9E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:51:47 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6eR-0001dQ-13
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:51:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6cg-0008VH-Px
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:49:58 -0400
Received: from [2607:f8b0:4864:20::42d] (port=34592
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6cf-0006gs-8w
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:49:58 -0400
Received: by mail-pf1-x42d.google.com with SMTP id l8so9009192pfu.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=327XM/aBhYQuTx9URqUGZSSanqSbDxIFXK31XaZ3dJc=;
 b=mfITWVW74/7+GUZbCx30cGqh4kz3cKSW9sXR7M/cMjZmv4FNU6TPWPbuAIrM9DiPiV
 RDLS9oAAN5/wEeELJcDB261Y1fJCJje2ZBDKKl7IxIKlRxXnXGfaVJqG1/zH5Xbd1RKS
 lgX+9S5qjIPg4TBLVz4o5SOhxBFQiNOQ26CH+ZADd9+7ZpBmiEWclT5RPJrnheXtDLIv
 3QXAOiBFWicSn0dc7I+RQEaTWRjttmELKa//4XUKMTLfP69QXTm2jSm1p1IYCrN6xKJF
 5oayOmq2WXUUjlTDCP8+Ybh6J6TfJ6rSPvYCiZrPt+j9jx3fzVyMp1vH0f8dAaCDt7aG
 oacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=327XM/aBhYQuTx9URqUGZSSanqSbDxIFXK31XaZ3dJc=;
 b=rvMcAZH+UuY2jMu1lOQc2KwGgIpeP39XMFX+v6vabFV+yte6t2KADq/pm9LS9bl0W/
 GqPqaZuZuykGwMQ6Ito1hSqxRYZQyS7oqS87BKmv+z7iMPRRzavncL1qsOpmHjj9He0T
 Vx8hfl/orgK5L15Jsh1Lt1lFWgYMTfsIxanFxCM2yuLc0E+rI/Aau1befr0XhJ9Zp31F
 c4mExGhBJkN9RBcJmaz5GQ/NIOMWE1PtdswWC1rm4D3pipa6F1zs0kDMJyEd+sy997BH
 CkjBgWCj2EdaN95BT3girwbA8LEruopXr5cnptEmWEnZkoD+eaiM7JwQxdPnWD2wguz4
 2XRQ==
X-Gm-Message-State: AOAM530ANAhkDFeK+N0TOHRNBp1zetu3OLdAExEGKOqFN+1XFxLIATTP
 q1jf1IoT5+sRdn2FuYIoLhc=
X-Google-Smtp-Source: ABdhPJyFtpe13zzLmiuvtGTJIB57y0DsAKi5DMTBfjqjA2Nq95hxhIw7N3lD/SPRVN9a2XssFfvO8w==
X-Received: by 2002:a63:f315:0:b0:376:2310:ffed with SMTP id
 l21-20020a63f315000000b003762310ffedmr23745502pgh.23.1647348594793; 
 Tue, 15 Mar 2022 05:49:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a627b17000000b004f6cf170070sm23806671pfc.186.2022.03.15.05.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:49:54 -0700 (PDT)
Message-ID: <05a48fb2-0d67-4e1d-6e3a-e61262196ea9@gmail.com>
Date: Tue, 15 Mar 2022 13:49:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] MAINTAINERS: Volunteer to maintain Darwin-based hosts
 support
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
 <20220315062708.p2xgxda46wou4uom@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315062708.p2xgxda46wou4uom@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 07:27, Gerd Hoffmann wrote:
> On Mon, Mar 14, 2022 at 09:27:38PM +0100, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> While I am not an experienced Darwin OS user, I now have to
>> use a macOS based workstation and alike CI, meaning I should
>> easily spot regressions and test fixes. I therefore volunteer
>> to collect Darwin related patches and keep QEMU in good state
>> on macOS, and to some extent iOS.
>>
>> Cc: Joelle van Dyne <j@getutm.app>
>> Cc: Alexander Graf <agraf@csgraf.de>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Cameron Esfahani <dirty@apple.com>
>> Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
>> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
>> Cc: Daniel P. Berrangé <berrange@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks, patch queued.


