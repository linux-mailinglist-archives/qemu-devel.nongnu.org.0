Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED611C12E3
	for <lists+qemu-devel@lfdr.de>; Fri,  1 May 2020 15:25:35 +0200 (CEST)
Received: from localhost ([::1]:38482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUVfZ-0004u8-RV
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 09:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUVdy-00040k-Mh
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jUVcz-00058f-U4
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:23:54 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jUVcz-000530-GU
 for qemu-devel@nongnu.org; Fri, 01 May 2020 09:22:53 -0400
Received: by mail-wr1-x443.google.com with SMTP id j1so11554805wrt.1
 for <qemu-devel@nongnu.org>; Fri, 01 May 2020 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=LkfqB0UTpiMGt3o1OkkfbXE14mvV41oG5EJ7Nep+sps=;
 b=h/wOK3k/c2lO+IvVrxXR/skC97483dcFDnFsGkzv9xyumCWkjRMdE+O1KzngG5Cv81
 K8M5MlaP0y7H2L9OFUjv5ADkfZsQnxO32Nbez2BF5CKTJBxAO252MDq/3a+FSvASYdvJ
 vzeGpfmxCE7Lu1yCmiErHJzsWsaBGbTknnPTuZSSkVQyeiJU5hAhk6vnLHAiKhPWIuj1
 lmsvdXPc4ULyQybOI6MWP3d+Hom0EzB6wI668leyorbf5bUtJyAVWrkPjTpucSN23zWD
 gxRsu04H95qrYov3E8Nkf3EDc4rmab4KdZZZ0CRdxZ0S9QRNK/arYr4TvB6dC/p+8w7U
 vIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=LkfqB0UTpiMGt3o1OkkfbXE14mvV41oG5EJ7Nep+sps=;
 b=e2EuVMUYvInE+PI01WKCc/rye5REaL0cjriO31fPS0lMlt0VQ138Inl8qKHGE3sJ4z
 QCPEq8Y7swvM7BD2yZ6z/dmAXMvpAogY9wa1neL0E+TpD9npAW8h3x7MoXCxVVMCBGXW
 nNmS+2idektvdSEQ2EuKS4n1QUeFBxJ38h/YDdwWqmn99yH3jACdrI1SyPO83mMuUBRW
 MPrq/cStl721txoXuZcqTomjIneZAAl7uk6y3QtYwyfVTwBRLbTuQotvZz1wSAks3EAI
 MWUxzun55dtJY6Cee/NEbvHC1QBZ7tYFHzxVvdtGn1Pe5hTlo/zcumYBPT358MjF2+Og
 iUDg==
X-Gm-Message-State: AGi0PuYtgoZ7306fo7YqzA47B4zbWXG6eDfBXL74ME5AFWg1emw8h7p7
 GvnSfzreM3SYzNc7xt9AxAcGrg7GGQA=
X-Google-Smtp-Source: APiQypJhyjzh70qnpertNilpyRieDHr6YWrYknAxDA8jJnr3tOBGclYsU4j1Y/y8EWaqmHpk60jaEA==
X-Received: by 2002:adf:f844:: with SMTP id d4mr4122374wrq.362.1588339370769; 
 Fri, 01 May 2020 06:22:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 138sm4182437wmb.14.2020.05.01.06.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 06:22:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFBE61FF7E;
 Fri,  1 May 2020 14:22:48 +0100 (BST)
References: <20200430190122.4592-1-alex.bennee@linaro.org>
 <20200430190122.4592-2-alex.bennee@linaro.org>
 <c69bbcae-1450-d75b-c05e-e9ee49bb53d5@redhat.com>
User-agent: mu4e 1.4.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v1 1/9] configure: favour gdb-multiarch if we have it
In-reply-to: <c69bbcae-1450-d75b-c05e-e9ee49bb53d5@redhat.com>
Date: Fri, 01 May 2020 14:22:48 +0100
Message-ID: <871ro3kcwn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::443
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 4/30/20 9:01 PM, Alex Benn=C3=A9e wrote:
>> As gdb will generally be talking to "foreign" guests lets use that if
>> we can. Otherwise the chances of gdb barfing are considerably higher.
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   configure | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/configure b/configure
>> index 23b5e93752..c58787100f 100755
>> --- a/configure
>> +++ b/configure
>> @@ -303,7 +303,7 @@ libs_qga=3D""
>>   debug_info=3D"yes"
>>   stack_protector=3D""
>>   use_containers=3D"yes"
>> -gdb_bin=3D$(command -v "gdb")
>> +gdb_bin=3D$(command -v "gdb-multiarch" || command -v "gdb")
>>     if test -e "$source_path/.git"
>>   then
>>=20
>
> This was also already reviewed:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg697748.html
>
> There seem to be a problem in your workflow.

Ahh I was only calling:

  #+CALL: check-and-fix-missing-signoffs()

in my PR workflow... fixed now thanks

--=20
Alex Benn=C3=A9e

