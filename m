Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901A47C13B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:14:44 +0100 (CET)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfud-0006Df-9v
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:14:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzc5T-0006JM-Vo
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:09:40 -0500
Received: from mail-108-mta18.mxroute.com ([136.175.108.18]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkfssion@mkfssion.com>)
 id 1mzc5S-0006Z8-0p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 05:09:39 -0500
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta18.mxroute.com (ZoneMTA) with ESMTPSA id 17ddc77bf05000b7bf.001
 for <qemu-devel@nongnu.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 21 Dec 2021 10:09:34 +0000
X-Zone-Loop: cfa5f8ca8ce8624c82ccd5c9695dcecd944f7110872c
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mkfssion.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YV8cqn82cI82j8pDcGqZPVw+C/XrIn5VyMJrLjaUXHE=; b=CpW8EqR9ob6x1zUhTFupGstEVi
 IegbxX+QcXlW4hidD0JfILmiZ7kosKmeBBNf+LYy9i9nXV6djK9/Dm4G07vMF9V/RgpeFd0dOQjfr
 0O4Fvr8wymEgsTiwOGeuscQPOOvNdb3wJnri7C3KGWFKOfg8WUxFX+dH/knHECkw+PeESDysLTe+b
 xdpro17isyrAg6HBD2C0kCoS0QVKP+MZr6i0FP9SrEl6mf3fdRHSLEpx/nuRTlY2L0elorZZSbv8w
 DH93xY09CMN5PnmGca4VXmtLnEBk9kO+r13qj3KJU1EaRZND0BOkpDxHnUWQjSVGbAgtjwnJ0Uk3F
 +87PxlLg==;
Message-ID: <96d6a35f-c109-0703-c42b-d2f7f4951105@mkfssion.com>
Date: Tue, 21 Dec 2021 18:09:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] vl: Add opts to device opts list when using JSON syntax
 for -device
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211220084544.54902-1-mkfssion@mkfssion.com>
 <d6a7cb7c-5813-158a-a86b-71cfab90402f@redhat.com>
From: MkfsSion <mkfssion@mkfssion.com>
In-Reply-To: <d6a7cb7c-5813-158a-a86b-71cfab90402f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AuthUser: mkfssion@mkfssion.com
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=-0.1, required=15, tests=[ARC_NA=0,
 URIBL_BLOCKED=0, FROM_HAS_DN=0, RCPT_COUNT_THREE=0, TO_DN_SOME=0,
 MIME_GOOD=-0.1, NEURAL_SPAM=0, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0,
 MIME_TRACE=0, MID_RHS_MATCH_FROM=0]
Received-SPF: pass client-ip=136.175.108.18;
 envelope-from=mkfssion@mkfssion.com; helo=mail-108-mta18.mxroute.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 21 Dec 2021 09:11:51 -0500
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, the patch is not well tested and it causes duplicate devices creation. I have send another patch to the mailing list to fix the issue.

On 2021/12/21 16:25, Philippe Mathieu-Daudé wrote:
> Cc'ing Markus.
> 
> On 12/20/21 09:45, MkfsSion wrote:
>> When using JSON syntax for -device, -set option can not find device
>> specified in JSON by id field. The following commandline is an example:
>>
>> $ qemu-system-x86_64 -device '{"id":"foo"}' -set device.foo.bar=1
>> qemu-system-x86_64: -set device.foo.bar=1: there is no device "foo" defined
>>
>> The patch adds device opts to device opts list when a device opts get
>> parsed.
>>
>> Signed-off-by: MkfsSion <mkfssion@mkfssion.com>
> 
> BTW per:
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line
> "Please use your real name to sign a patch (not an alias or acronym)."
The issue has been fixed in new patch.
> 
>> ---
>>  softmmu/vl.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 620a1f1367..0dd5acbc1a 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -3400,6 +3400,8 @@ void qemu_init(int argc, char **argv, char **envp)
>>                      loc_save(&opt->loc);
>>                      assert(opt->opts != NULL);
>>                      QTAILQ_INSERT_TAIL(&device_opts, opt, next);
>> +                    qemu_opts_from_qdict(qemu_find_opts_err("device", &error_fatal),
>> +                                         opt->opts, &error_fatal);
>>                  } else {
>>                      if (!qemu_opts_parse_noisily(qemu_find_opts("device"),
>>                                                   optarg, true)) {
> 

