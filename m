Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7282333128
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:43:41 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk8i-0004qT-Lm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lJk4R-0001ln-MM; Tue, 09 Mar 2021 16:39:15 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:27066
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1lJk4Q-0007FP-4k; Tue, 09 Mar 2021 16:39:15 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Dw7tg4L2Pz8PbN;
 Tue,  9 Mar 2021 16:40:59 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=3G4ER0wlF
 7jbLUGOb1J+c+mCTwY=; b=XQNM5ywjqO36RtRMyGE2X2mO3H0zap9obAZ1nLVLS
 OoiUnyjPGRo8BZDDtm8Vdc8Q7185hz7ABeZkecKluLjlFn7Tr9D5SCMJmF8A2l03
 DjUUFwbPQn0k20bolpiJ2YCyn4tXtDP5QOa0zhoLFC1xACBoYvWXxhOJSOl7ViEE
 4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=dCr
 aqjkvTaZJy0+G3aBc+kj54txFub3fUmaZOOZBRUsQfd4kFirVTHFpE7OR75jbUN0
 HZByX97ounqzptOEbO1rnBW2UxBRDsPWeVoYg03Vl6xbZOqCLA6Y7SvFg+1Q4WCT
 eRgXkGsAVkdwAmZyafo4yOFa/CCmuGt102shdOfs=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-43-174-88-243-61.dsl.bell.ca [174.88.243.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Dw7tg3NTrz8PbK;
 Tue,  9 Mar 2021 16:40:59 -0500 (EST)
Message-ID: <d799a899-f173-110f-7426-40477b27edf2@comstyle.com>
Date: Tue, 9 Mar 2021 16:38:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/8/2021 6:46 AM, Thomas Huth wrote:
> On 22/02/2021 08.28, Brad Smith wrote:
>> OpenBSD has supported 64-bit time_t across all archs since 5.5=20
>> released in 2014.
>>
>> Remove a time_t cast that is no longer necessary.
>>
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 52e2d72e4b..9557f85ba9 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool=20
>> overwrite, const char *vmstate,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (name) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstrcpy(sn->nam=
e, sizeof(sn->name), name);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* cast below needed for O=
penBSD where tv_sec is=20
>> still 'long' */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r((const time_t =
*)&tv.tv_sec, &tm);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 localtime_r(&tv.tv_sec, &t=
m);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strftime(sn->na=
me, sizeof(sn->name),=20
>> "vm-%Y%m%d%H%M%S", &tm);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> Please make sure to CC: the maintainers (see MAINTAINERS file). Done no=
w.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>


My bad. That was an oversight on my part. I was quick to send it to the=20
list without thinking
about something like that.


