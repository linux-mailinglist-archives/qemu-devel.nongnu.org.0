Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D189E2E2249
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 22:58:17 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksC9A-00072q-F4
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 16:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ksC7b-0006Rn-Pp; Wed, 23 Dec 2020 16:56:39 -0500
Received: from mail.mutex.one ([62.77.152.124]:54174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1ksC7a-0005Q4-5p; Wed, 23 Dec 2020 16:56:39 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 7BAE1BF42692;
 Wed, 23 Dec 2020 23:56:33 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RF7RulwkHbuY; Wed, 23 Dec 2020 23:56:32 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 9AD09BF4268F;
 Wed, 23 Dec 2020 23:56:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1608760592; bh=XlvxpJla/T2ZCekfMPOKT/tRdVvDmBYNDdr7ClTi81Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FbTIiefEx2liBUIWlDoYDuLu87+1oa28iWtvWYTpP8lkSWN40ISicGP+IRc/qOwim
 yydjWdRkdodrni6FJmATkuPkfpAkpdq60FlxBAFaNv124RT9NcXuomReEs4Zo7Rcp6
 SonRinnjWVwxfL4DJrtce4Nph0jzbrYl7NZrXBT4=
From: Marian Posteuca <posteuca@mutex.one>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2] acpi: Permit OEM ID and OEM table ID fields to be
 changed
In-Reply-To: <20201223115445.71dc9f8c@redhat.com>
References: <20201222113353.31224-1-posteuca@mutex.one>
 <20201223115445.71dc9f8c@redhat.com>
Date: Wed, 23 Dec 2020 23:56:30 +0200
Message-ID: <878s9onq41.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
 "Michael S.
 Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Dongjiu Geng <gengdongjiu@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thanks for the thorough review.

Igor Mammedov <imammedo@redhat.com> writes:
> On Tue, 22 Dec 2020 13:33:53 +0200
> Marian Posteuca <posteuca@mutex.one> wrote:
>
> I see defaults are now initialized in pcmc->oem_[table_]id fields,
> and sometimes used from there, so question is why
> do we need use_sig_oem and keeping old code
>
>     if (oem_id) {                                                                
>         strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);                    
>     } else {                                                                     
>         memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);                               
>     }                                                                            
>                                                                                  
>     if ()) {                                                          
>         strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id)); 
>     } else {                                                                     
>         memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);                         
>         memcpy(h->oem_table_id + 4, sig, 4);                                     
>     }  
> I'd rather drop 'else' branches altogether and simplify to something like this
>
> g_assert(oem_id);
> strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
> g_assert(oem_table_id)
> strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
> + padding
>
> and make sure ids are properly propagated everywhere.
>

I'm not sure if I understood this point correctly. You want to remove the appending
of the sig part to the oem_table_id field, and just use whatever is
passed by the caller for oem_table_id?



