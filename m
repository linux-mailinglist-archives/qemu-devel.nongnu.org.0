Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0C255BFB3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:08:26 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67Cq-0005jl-P0
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o66tS-000806-Ho; Tue, 28 Jun 2022 04:48:23 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o66tQ-0007pd-P9; Tue, 28 Jun 2022 04:48:22 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2mS2-1neSAV1EJY-0137Z0; Tue, 28 Jun 2022 10:48:07 +0200
Message-ID: <e6374ac2-1503-4b16-228d-122e4a058dbc@vivier.eu>
Date: Tue, 28 Jun 2022 10:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] vga: avoid crash if no default vga card
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, Guo Zhi <qtxuning1999@sjtu.edu.cn>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20220503091724.970009-1-qtxuning1999@sjtu.edu.cn>
 <1192fecb-a730-65e1-c3fe-1e89456e6981@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1192fecb-a730-65e1-c3fe-1e89456e6981@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4sPpTjsOi4YTLvn3MWq+dx8IlO5Q1kdCPN2NVWi8toTYrVNa8iT
 QMDdYKWK0h1jwVxG/iXEkTV1JGra4tOMllkb3qGICO7gj6f/8qKt+UhFm+ZiFg17TWnfDrQ
 STRwGbHNFvsN0vmsa9s7yFgE5ZfFbtTMfMZS77s+7XfVKbrGNxzzB4cUQBxzOdBFGTWsHdv
 eFnrl3S8XgJAqZ22sPAtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oyUVnL9XpnE=:rxLoI5IUHjLFxo9HHTxmEQ
 mymjcMx0xyJh22yiBmDc3ZfgoHiLwg79lgCcp1DCEHYjfzuTWoYpnU7SAebzo11KLXcNWhBz0
 iOdYZm/bMtQUsncHYE5W562TgcGCRjK9ATmgnAd31rbkfszJMqef4teJY5pRp5Cb2wGc6IXQ3
 ocrP60KaaUcc8ERTbTKFYi4XFp/D0UMdGdq2EpuGkT4UI8Hut2yLimn6mR3QVkSCOfu23heq1
 GGStErLXR9XTssQ8tpxz93wJONYSosZlTUTjBJmji6npQGfVZtYHmxNwFb4zGOs0xPRYs3mYU
 4aE4VUBK5x8BjGQAvFXchklN1FF+p8pNBZ1ei8z31pNRNlfPFljtSXDJozpTuaqeSEAE0Ybt/
 4L85LqiifvW08S2N4oxit/J3dBiLgDhPjNl6+KUMF4cl8vcgnIGIi4MuDfW3WXZEGydNzgcFB
 RaFPEcJQgCmaK2hySI8B+fL6pErZz+3O0CtcjL90zozT1OeVoCB5B45r60H+nIVneS95thDFh
 9soq3qp9rh78yVjCf+UGcgyXGoZryl/Hz+XwuKBQ46IiR+A0hLNqUO8QDQ8jOHcw66E1sGg46
 SnL+zlt3JiTcRlp9pMDgGsbXGP2xgoG+y1MvYqRgxsp+ZCMhW0Iu2oyFXxIWZ1KHFsO3Zuow1
 4GVVPO5LQzYNSCQ2ZSNZvhpZB4L52nDL6uAHJEg/cMoljx4e8SlIxsM+vTRsxVCuCdXKNK8VX
 rsSEf0em23GZpF0Pz0uTDt6JK1hfTyRqLBg+1g==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 03/05/2022 à 17:39, Thomas Huth a écrit :
> On 03/05/2022 11.17, Guo Zhi wrote:
>> QEMU in some arch will crash when executing -vga help command, because
>> there is no default vga model.  Add check to this case and avoid crash.
>>
>> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
>> ---
>>   softmmu/vl.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index c2919579fd..a49e29312b 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -977,7 +977,8 @@ static void select_vgahw(const MachineClass *machine_class, const char *p)
>>               if (vga_interface_available(t) && ti->opt_name) {
>>                   printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
>> -                       g_str_equal(ti->opt_name, def) ? " (default)" : "");
>> +                        (def && g_str_equal(ti->opt_name, def)) ?
>> +                        " (default)" : "");
>>               }
>>           }
>>           exit(0);
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/978
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> 
>

Applied to my trivial-patches branch.

Thanks,
Laurent


