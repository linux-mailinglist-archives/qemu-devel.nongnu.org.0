Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC7E4E5EFA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 07:54:36 +0100 (CET)
Received: from localhost ([::1]:57894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXHMg-0008LG-Rf
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 02:54:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXHKn-0007dW-Uq
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 02:52:38 -0400
Received: from mga11.intel.com ([192.55.52.93]:13099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoyao.li@intel.com>)
 id 1nXHKl-0007rA-I7
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 02:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648104755; x=1679640755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q3/NuftGfLPPjfiFFvPfNgBlxWkXnmen2C4wwhW3JZw=;
 b=AwIMnYsvlyvxijHT8YH3UBBp3LU/EhDuGR0R0qo8mKECCH19g6LP/6od
 wTrN9Vgsa/EtLEYAh27/kMkTzCdEe49Tahtks3CqqpiMHJ7RSnttv723g
 88LoDMaR6KCzTH9xHgjhFqScOkGTULwDxeCEAR3hCess+rt9K9seLuf6V
 Kf/so9rHymGjrJViZl7kFD/xFUKGbFSmS9RgU2clhoAybHm93eRT5BfSU
 0MqiFiw2wbARjY50tMKf96NFOFyiNkQ4or34IjuL5KmAH8e+AY9yyy5V6
 RDw2iNeBlrmxSCS6/f/CO0l12344CiYXu9o1QJLlJ7ogBEQ2lrLIKu4pj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="255867094"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="255867094"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 23:52:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561239669"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.249.201.150])
 ([10.249.201.150])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 23:52:12 -0700
Message-ID: <b452d357-8fc2-c49c-8c19-a57b1ff287e8@intel.com>
Date: Thu, 24 Mar 2022 14:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [RFC PATCH v3 12/36] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-13-xiaoyao.li@intel.com>
 <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20220322090238.6job2whybu6ntor7@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=xiaoyao.li@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, seanjc@google.com, erdemaktas@google.com,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/2022 5:02 PM, Gerd Hoffmann wrote:
> On Thu, Mar 17, 2022 at 09:58:49PM +0800, Xiaoyao Li wrote:
>> Add sept-ve-disable property for tdx-guest object. It's used to
>> configure bit 28 of TD attributes.
> 
> What is this?

It seems this bit doesn't show up in the public spec yet.

Bit 28 (SEPT_VE_DISABLE): Disable EPT violation conversion to #VE ON 
guest TD ACCESS of PENDING pages.

The TDX architecture requires a private page to be accepted before 
using. If guest accesses a not-accepted (pending) page it will get #VE.

For some OS, e.g., Linux TD guest, it doesn't want the #VE on pending 
page so it will set this bit.

>> --- a/qapi/qom.json
>> +++ b/qapi/qom.json
>> @@ -792,10 +792,13 @@
>>   #
>>   # @attributes: TDX guest's attributes (default: 0)
>>   #
>> +# @sept-ve-disable: attributes.sept-ve-disable[bit 28] (default: 0)
> 
> I'd suggest to document this here.
> 
> thanks,
>    Gerd
> 


