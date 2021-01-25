Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4B30268B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:55:21 +0100 (CET)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Gy-00027f-U1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43Ea-0000JV-Pe
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l43EY-00062t-PC
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611586369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJkrszPqo2I4VziP0mu1vjpTHXYxq1zyaB1mBUSPjFM=;
 b=GhyekckWgWym43gKlkEtyHm6q5hH5bwBT+mnU6aIcCm0Uhu7lZTdSksSDKdOBW1YuDYCVD
 YrOX85Zh+dLmOvLik/8URU/Ok/Zxw/t7BzcxFj0Kgkpw4ba4WAX6x2RE8Snr7svx3LSmLT
 06taN0eWTFh0vglyt6Pnju3rZkYRu+A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-jN7PROmnOAqEBf7q6QtDYQ-1; Mon, 25 Jan 2021 09:52:46 -0500
X-MC-Unique: jN7PROmnOAqEBf7q6QtDYQ-1
Received: by mail-ej1-f70.google.com with SMTP id jg11so3880644ejc.23
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VJkrszPqo2I4VziP0mu1vjpTHXYxq1zyaB1mBUSPjFM=;
 b=YsGmcVyWVlF0rBcZjCL+IZinHhMKtXoW4M4gr1RVCPIlEO7xPZokSY3YpBnXfsqdUl
 oEfCQ+zmroF4KfBRoEmK8ofVugVzQ070L7MAP9HJ4JKAXKsTfTeWnFLRfsi5ZiQfijsT
 XpqWjJ1jCU5OxIJNbgPogEsuW3aVCrxUOCL3OjnBr4vOD2jj9A1SSHi1BEJosw1g5tIV
 t/Gv/ChNTGZqD1245TJA9mx71UPg34Bt9dnFTYZlT2RcNmaoonroc3LTM2lJQFuLNboX
 f47eM7EDQH7b7kqDzH68UgJIO5llqjMIuRQl5xQ0gf6F+2QI82GCR8BV4vhbC39bUVte
 CLsA==
X-Gm-Message-State: AOAM531CEJnh9redTeye4mJD6UTaZmc2CVceGERBFADc5yIyJ0iDYcI1
 0ZDBRhWKYGojXkf5aKq0vqS9UQpQWC3tR7FAKahcJWpXv7xYsQjbj4F8nJOkj8TbOOzPNub0YA/
 DwIVgAIL7czzeaMU=
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr619583ejb.132.1611586365704; 
 Mon, 25 Jan 2021 06:52:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxUApqZS7oxF2joYRSzkMuGEdE7p1wxgTyxOTldyTIvN2RmYtOBkZGRQ8fr1rz5EDnlr30pA==
X-Received: by 2002:a17:906:34c3:: with SMTP id
 h3mr619565ejb.132.1611586365498; 
 Mon, 25 Jan 2021 06:52:45 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id u23sm4225952edt.87.2021.01.25.06.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 06:52:44 -0800 (PST)
Subject: Re: [PATCH] hw/scsi/megasas: check for NULL frame in
 megasas_command_cancelled()
To: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>
References: <20201224175441.67538-1-mcascell@redhat.com>
 <CAA8xKjWf8HBj6qgZ8iJTW0hbU8D6QKcycxT-hBo8=HG3TD36NQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <769d08e0-1da8-f281-65ec-f7d085b850f0@redhat.com>
Date: Mon, 25 Jan 2021 15:52:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAA8xKjWf8HBj6qgZ8iJTW0hbU8D6QKcycxT-hBo8=HG3TD36NQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, cwmyung@snu.ac.kr, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You forgot to Cc the subsystem maintainers...

./scripts/get_maintainer.pl -f hw/scsi/megasas.c
Hannes Reinecke <hare@suse.com> (supporter:megasas)
Paolo Bonzini <pbonzini@redhat.com> (supporter:SCSI)
Fam Zheng <fam@euphon.net> (reviewer:SCSI)

On 1/25/21 3:22 PM, Mauro Matteo Cascella wrote:
> Hello,
> 
> Any updates on this little patch? Please find below a reproducer for
> this bug (thanks Alexander):
> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg02567.html

"Little patch" but with security involvements ;)

As Paolo usually asks for reproducer to be integrated with the fix,
it might save him/you time if you respin with the reproducer. You
can have a look at
https://www.mail-archive.com/qemu-block@nongnu.org/msg78982.html
for example.

That said, unrelated to your patch but I'm not sure how useful it
is to test for bugs found by fuzzer each time in our CI. There are
borderline cases not representing proper use. Maybe we could run
them weekly instead...

> Thank you,
> 
> On Thu, Dec 24, 2020 at 6:55 PM Mauro Matteo Cascella
> <mcascell@redhat.com> wrote:
>>
>> Ensure that 'cmd->frame' is not NULL before accessing the 'header' field.
>> This check prevents a potential NULL pointer dereference issue.
>>
>> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1910346
>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
>> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
>> ---
>>  hw/scsi/megasas.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
>> index 1a5fc5857d..77510e120c 100644
>> --- a/hw/scsi/megasas.c
>> +++ b/hw/scsi/megasas.c
>> @@ -1893,7 +1893,7 @@ static void megasas_command_cancelled(SCSIRequest *req)
>>  {
>>      MegasasCmd *cmd = req->hba_private;
>>
>> -    if (!cmd) {
>> +    if (!cmd || !cmd->frame) {
>>          return;
>>      }
>>      cmd->frame->header.cmd_status = MFI_STAT_SCSI_IO_FAILED;
>> --
>> 2.29.2
>>
> 
> 


