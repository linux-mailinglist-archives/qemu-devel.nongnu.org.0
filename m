Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F659380B36
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 16:11:09 +0200 (CEST)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhYWy-0004gH-Bc
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 10:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhYVp-0003MI-OM
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhYVo-0000oQ-0r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 10:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621001395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H89hAj45JsULgDkW02KFGLsLfbhgocSi6FA4Fg1wmjA=;
 b=PRs3I1RBihiJkviD4Lt+RjuSm7rlvPNwt+POOK2Po04Mglv9l9KUK/PSZx8K7O4+vMCiv+
 tyK5/nqeoOSD7H8z5QCzvsX3cRhdAUYgfzMpETxNe6tmFp0tRIP/2JZM4kb0zaMoLfgsl5
 W1kyxft5fIYYY+/GqAGZaXneJ8y8e60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-cGXH9Z_fNYOhWCgdw5f1zQ-1; Fri, 14 May 2021 10:09:52 -0400
X-MC-Unique: cGXH9Z_fNYOhWCgdw5f1zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4365B394;
 Fri, 14 May 2021 14:09:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-49.ams2.redhat.com
 [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0E060CCF;
 Fri, 14 May 2021 14:09:49 +0000 (UTC)
Subject: Re: [PATCH v2] qemu-iotests: fix pylint 2.8 consider-using-with error
From: Max Reitz <mreitz@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210510190449.65948-1-eesposit@redhat.com>
 <d2253d8d-89dd-1acf-e005-0fb3aee6610d@redhat.com>
Message-ID: <6fe978ce-be8c-db43-120d-95cb66769bfe@redhat.com>
Date: Fri, 14 May 2021 16:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d2253d8d-89dd-1acf-e005-0fb3aee6610d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.05.21 19:04, Max Reitz wrote:
> On 10.05.21 21:04, Emanuele Giuseppe Esposito wrote:
>> pylint 2.8 introduces consider-using-with error, suggesting
>> to use the 'with' block statement when possible.
>>
>> Modify all subprocess.Popen call to use the 'with' statement,
>> except the one in __init__ of QemuIoInteractive class, since
>> it is assigned to a class field and used in other methods.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>> v1 -> v2:
>> * fix indentation [Max]
>> * explain why we disabled the check in QemuIoInteractive's __init__ [Max]
> 
> Thanks!
> 
> Applied to my block branch:
> 
> https://github.com/XanClic/qemu/commits/block

I’ve just seen that the “# pylint: disable=consider-using-with” line 
causes a warning in pylint versions that don’t know that warning…

I’d like to squash this in:

> diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
> index 7a6c0a9474..f2c0b522ac 100644
> --- a/tests/qemu-iotests/pylintrc
> +++ b/tests/qemu-iotests/pylintrc
> @@ -19,6 +19,9 @@ disable=invalid-name,
>          too-many-public-methods,
>          # pylint warns about Optional[] etc. as unsubscriptable in 3.9
>          unsubscriptable-object,
> +        # Sometimes we need to disable a newly introduced pylint warning.
> +        # Doing so should not produce a warning in older versions of pylint.
> +        bad-option-value,
>          # These are temporary, and should be removed:
>          missing-docstring,
>          too-many-return-statements,

Would that be OK for you?

Max


