Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58341968E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:41:39 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrp4-00068K-4o
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUrio-0007c4-Cz
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:35:12 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUrim-00073U-GB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:35:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so774739wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6t3Hb1R8EVZRBtNbszmoehYjeTiuWP6GyXcpyR8c9qU=;
 b=Dd41YpjMoX/+46Ko6gebKSmAf4A+uM1//wA/JN7MBg6qFbAT4BMkFy+5zVzFG27V2X
 Xq5SPgmuPl8EzXYO1P1xK3QI3RHgB5oPBV77V0PVenEOS/audkyYZLWWmi2tfw5K463D
 /9r/O15Flk+K04bmCCh4FHGRPLeJfA2PRD2OA/+mIGH/hnAC2u/UBELDwiQLe7t84vtb
 +cc4zxe5stnYXRBHC9qc4i5JJnzKjack1EbqCIcXQqaj4zyTZCO/TOEKYz4GsMEGM4Te
 g8EW1X9bsebpDn2/RDgz+ZZPO/u+kcypTcEsoJI/TYlnOyNYW1lpGoGGQUQUSlNzlaOu
 53BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6t3Hb1R8EVZRBtNbszmoehYjeTiuWP6GyXcpyR8c9qU=;
 b=YbWEbgwxHhrK2V9bh5smdwtSMXr3buNLitnstR/6DnrW2qlrJukJRToLNj1S4lNyMn
 wFsM3p3iuozNalinv2DbDlM2v2El8TVmaPd8xgN83NGvM59I2biEJjAUUNgz4dasfcnz
 ht3HhQrPsIfT1GvGyuFNoyV4+8Sn7YF7cmDG1a+6y8yrkDJHf81e2rdkCFlQOTmsRw5m
 B4QeFDQCQudVoCO1Hdcs2laFVL1I57kUw7o16VKxAd7xhrSrLpNEaM9nKjW3wmOWYSHh
 Kq13YBNwM2+nBnJm1cGj4CuksucwgtLmdMbjBsWGugwN7+5oLkOcqLTVTA7bbN3mF8Cv
 9wxQ==
X-Gm-Message-State: AOAM533mjW3ieUglPXlUtGVGMgS01Nc1a886UqeD6b6Bc3Lek6bNoEfX
 qtOnkTo3nXr5EDF02ARBNiU=
X-Google-Smtp-Source: ABdhPJxBs73+GBz5HEEU5GwjvDTUTLFX/7YSJnA2R/iqPAMjpgXW27s2h46cd+3od0X8KvdzRFJtgA==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr16101338wmi.37.1632753306421; 
 Mon, 27 Sep 2021 07:35:06 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f1sm17111846wrc.66.2021.09.27.07.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 07:35:05 -0700 (PDT)
Message-ID: <89b3ce1b-5eea-a3e2-8361-493a8a96d6a2@amsat.org>
Date: Mon, 27 Sep 2021 16:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com> <YVHLVT6xS6YjUxFN@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YVHLVT6xS6YjUxFN@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.136,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 15:47, Daniel P. Berrangé wrote:
> On Mon, Sep 27, 2021 at 09:35:22AM +0100, Daniel P. Berrangé wrote:
>> On Sun, Sep 26, 2021 at 07:23:56PM +0200, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> FYI the OpenSUSE job is failing since few days, i.e.:
>>> https://gitlab.com/qemu-project/qemu/-/jobs/1622345026
>>>
>>>   Retrieving repository 'Main Repository' metadata
>>> [..........................................................error]
>>>   Repository 'Main Repository' is invalid.
>>>
>>> [repo-oss|http://download.opensuse.org/distribution/leap/15.2/repo/oss/]
>>> Valid metadata not found at specified URL
>>>   History:
>>>    - Download (curl) error for
>>> 'http://download.opensuse.org/distribution/leap/15.2/repo/oss/repodata/repomd.xml':
>>>   Error code: Curl error 56
>>>   Error message: Recv failure: Connection reset by peer
>>>    - Can't provide /repodata/repomd.xml
>>>   Please check if the URIs defined for this repository are pointing to a
>>> valid repository.
>>>   Warning: Skipping repository 'Main Repository' because of the above error.
>>>
>>> I tried to run 'zypper ref' with:
>>
>> It isn't confined to only SuSE. In libvirt we've had similar problems
>> with several other jobs, though are suse jobs are the worst affected.
>>
>> GitLab have finally acknowledged it is an general infra issue affecting
>> many things:
>>
>>    https://status.gitlab.com/
>>    https://gitlab.com/gitlab-com/gl-infra/production/-/issues/5590
> 
> Setting GitLab CI env var works around the problem temporarily:
> 
>  FF_NETWORK_PER_BUILD=true

Do you know if we need to recreate the pipeline?
(It didn't work on already failing one, I'm going to test
a freshly created one now).

> You can set it for all repos under a group eg
> 
>   https://gitlab.com/groups/qemu-project/-/settings/ci_cd
> 
> or per repo eg
> 
>   https://gitlab.com/berrange/libvirt/-/settings/ci_cd
> 
> 
> Regards,
> Daniel
> 

