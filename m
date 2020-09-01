Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9A25885D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 08:39:49 +0200 (CEST)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCzxM-0001KL-Oc
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 02:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kCzvP-00085U-Af; Tue, 01 Sep 2020 02:37:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:51215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kCzvN-0002pK-Md; Tue, 01 Sep 2020 02:37:47 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M42fG-1kCzvG1Rq4-0005Km; Tue, 01 Sep 2020 08:37:38 +0200
Subject: Re: [PATCH 08/12] block/vmdk: Remove superfluous breaks
To: Thomas Huth <thuth@redhat.com>, Yi Wang <wang.yi59@zte.com.cn>,
 qemu-devel@nongnu.org
References: <1594631107-36574-1-git-send-email-wang.yi59@zte.com.cn>
 <ea32b527-7d78-1c7a-a2a2-30ffa2a9e528@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ad7366a2-64e9-c088-d988-abdecba8067d@vivier.eu>
Date: Tue, 1 Sep 2020 08:37:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ea32b527-7d78-1c7a-a2a2-30ffa2a9e528@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GtLufzURPVJUpet6Yc4lYhCeFrvXHm6g73WgU8h7lGykVBbR+33
 IQxZnQe3Dco9+OwzXQcoF3DP3kOVgGckRWxsdv8Xv+B9JVAwavlfsoMHmOXdfqW+R/GSTyG
 xPd/qRuoalFurEzrwRFzgZmKb5aY1jttjt+Zh6Q4L/soqmjQUhwy/ntsw+7kUSSRsGuhWfN
 yLvjGK3eLIsl8YK7CVShw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRGVja6Lrvw=:28VSRAQ0amDoB87pnYu8JX
 qge05JmnCWQ7L9PomyMRxpNnFFqB4Jo0/gxVl88KVY+z1mtQHJlUWXAyb0kKLBMenEgO6DFvm
 aubIbVMHSF+Ukf52M/ZfVd22mc2J1Lf6+kdd6Bw0x0vYVjvfipw1nYInvG3yl5eEq85sellCb
 5KhbwW95A9T519W4BjzxidGsxX6Fr66x2VIld/hw+Rv8LJoy/bFrSoJzedLA+4wLJ9LVR+usi
 Vzn8PTnzSRMKQn7PJBtoD9w5jvj7KXTJ8UHenY8ZUTgGc8VRl49qAIG0UOUPAsblNnKQXbv01
 4O/my3V2lVPE4n8k43NkChdf+5XtcxyKuCN+8yh7P67kn9gYXteoXuTRmfeVLFyusan2QzBeN
 yxcAm0t+k++b+mhUL9jKpourqHTVvKHMgYQjOMVR1Q2U4NMlm9gKXTeI/FK79685gykVorkGf
 LrW/mShOfofL56Fu1J/iUFQyQF72HcMTfOM8Kwn0liGweJUOTIDQ1qzLoQdHX6SUXNwZPpk8h
 u/igDjX/Nrb8J5cgQUgHMSTDaGBZO7xxGFkRNTXPoGnmvkFsgzgQm3ik3zMr9B6vuT7HXdTxc
 ydyPFa041JU77MCR1rHjgUXcuYArujvAGxq438iOJSNdh8bpmN+BFqw1SA8NKj9APU/v4h8FO
 NE6ARnL6LPKioGu7SEQu6kymaXwl9AStJHpH/3hA6VCZnO7PBF0KWidyfI24A753QVC8pm2lj
 ZcIucj5E5kJqs3ibMMVjoqrsEcvoMneaB7Rw+IwUQXjRLxxKCrjQXVhy+R0C/CLFU+q/Td80K
 iTXVRL/TDo8wXPRPdymVIXWYsTJHpn8C6yyz4Tf3E/+kYInBP4N0AikxLlM6s/2P7T/CnWu
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:33:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, wang.liang82@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>, Qemu-block <qemu-block@nongnu.org>,
 xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/07/2020 à 11:36, Thomas Huth a écrit :
> On 13/07/2020 11.05, Yi Wang wrote:
>> From: Liao Pingfang <liao.pingfang@zte.com.cn>
>>
>> Remove superfluous breaks, as there is a "return" before them.
>>
>> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
>> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  block/vmdk.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/block/vmdk.c b/block/vmdk.c
>> index 28cec50..8f222e3 100644
>> --- a/block/vmdk.c
>> +++ b/block/vmdk.c
>> @@ -1053,14 +1053,11 @@ static int vmdk_open_sparse(BlockDriverState *bs, BdrvChild *file, int flags,
>>      switch (magic) {
>>          case VMDK3_MAGIC:
>>              return vmdk_open_vmfs_sparse(bs, file, flags, errp);
>> -            break;
>>          case VMDK4_MAGIC:
>>              return vmdk_open_vmdk4(bs, file, flags, options, errp);
>> -            break;
>>          default:
>>              error_setg(errp, "Image not in VMDK format");
>>              return -EINVAL;
>> -            break;
>>      }
>>  }
>>  
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


