Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AE58EEE5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 16:59:04 +0200 (CEST)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLnAl-0002fI-B9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 10:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLn9D-0001DL-3p
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1oLn9A-0005PH-KD
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 10:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660143443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GOM3TCNInYq86ECPPbAmqLEUXBt73dmpVkc35aKck0=;
 b=BbsrVJx9TLJJoIX/3fHk0ad1oVi3ep4cTs2VuHnR3hNy0fDbrMQP8zSzaDe27iXBuBcvti
 v0xsDvadmtf10gy91AU+6I2AjMJX8uWgw2F+8xLtBYtiL7RzTRyC8IR0bqdMTygLtYNux7
 TMiWHNqsS/on+4YTD8rZSDPfXPyuXfE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-VDGJxngVMi6iW-u2bn5jag-1; Wed, 10 Aug 2022 10:57:22 -0400
X-MC-Unique: VDGJxngVMi6iW-u2bn5jag-1
Received: by mail-ej1-f72.google.com with SMTP id
 ho13-20020a1709070e8d00b00730a655e173so4314762ejc.8
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 07:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4GOM3TCNInYq86ECPPbAmqLEUXBt73dmpVkc35aKck0=;
 b=i3mBOi/VWb4ILR71h4/59pCLMclcQFBsYJt79PX0MTE3dCUAcOoMn2vAriS62vCapY
 XSyPoZhMYv1PoXmQZ7rN1fPfmzdERY7vOEA6ohb5O2JbhTb47tzmq5JqdmNuPD2Bo4rr
 l7U9kkhOJAd5pkLITicBq/HPU9PMGMLS0XGdt1NqDurNxwdswFHXUJjmGYjLu6NgXTEp
 qfBmDeGZM0KGKz3WIUVUqy7ItAmxmLnzVI1hguS5G5R3hmzlIL6wkev0GCb2uriTVRwk
 Ta0k0mBmbKsPxyxNIT3/coaFsja0l5AHeYehE0uFkhVD9eUI33J27RRWsFA1M4DpNyK/
 zjhA==
X-Gm-Message-State: ACgBeo3cIzNCbiiohlWk40pNo0HUy+e+DMTmoaYZurHN9ME8qzhY3sPt
 EpbDswV0lR2ZBiFxG6BFqwsIO9neHHv3ps95s7PYTsCTeT8IaxXRCscrUI0uYHwEcqsvK6PWs8d
 byLrADtbiWrm5Upo=
X-Received: by 2002:a05:6402:27d3:b0:43e:5490:27ca with SMTP id
 c19-20020a05640227d300b0043e549027camr27952357ede.307.1660143441284; 
 Wed, 10 Aug 2022 07:57:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ep8nDOBMITbWQ0WkV7eeRgI5dHitmfDDJOUe85Cr7DwW0zgf9unaVeoWJOj6YwrJ/TRVsfQ==
X-Received: by 2002:a05:6402:27d3:b0:43e:5490:27ca with SMTP id
 c19-20020a05640227d300b0043e549027camr27952336ede.307.1660143441040; 
 Wed, 10 Aug 2022 07:57:21 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 bl8-20020a170906c24800b007304bdf18cfsm2404311ejb.136.2022.08.10.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 07:57:20 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH RFC v1 2/2] i386: reorder kvm_put_sregs2() and
 kvm_put_nested_state() when vCPU is reset
In-Reply-To: <11df1501c60809e5d83e2591fb43a3b660afaef4.camel@redhat.com>
References: <20220810140007.1036293-1-vkuznets@redhat.com>
 <20220810140007.1036293-3-vkuznets@redhat.com>
 <11df1501c60809e5d83e2591fb43a3b660afaef4.camel@redhat.com>
Date: Wed, 10 Aug 2022 16:57:19 +0200
Message-ID: <87mtccxi28.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Maxim Levitsky <mlevitsk@redhat.com> writes:

> On Wed, 2022-08-10 at 16:00 +0200, Vitaly Kuznetsov wrote:
>> Setting nested state upon migration needs to happen after kvm_put_sregs2=
()
>> to e.g. have EFER.SVME set. This, however, doesn't work for vCPU reset:
>> when vCPU is in VMX root operation, certain CR bits are locked and
>> kvm_put_sregs2() may fail. As nested state is fully cleaned up upon
>> vCPU reset (kvm_arch_reset_vcpu() -> kvm_init_nested_state()), calling
>> kvm_put_nested_state() before kvm_put_sregs2() is OK, this will ensure
>> that vCPU is *not* in VMX root opertaion.
>>=20
>> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
>> ---
>> =C2=A0target/i386/kvm/kvm.c | 20 ++++++++++++++++++--
>> =C2=A01 file changed, 18 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
>> index 4f8dacc1d4b5..73e3880fa57b 100644
>> --- a/target/i386/kvm/kvm.c
>> +++ b/target/i386/kvm/kvm.c
>> @@ -4529,18 +4529,34 @@ int kvm_arch_put_registers(CPUState *cpu, int le=
vel)
>> =C2=A0
>> =C2=A0=C2=A0=C2=A0=C2=A0 assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(=
cpu));
>> =C2=A0
>> -=C2=A0=C2=A0=C2=A0 /* must be before kvm_put_nested_state so that EFER.=
SVME is set */
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * When resetting a vCPU, make sure to reset ne=
sted state first to
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * e.g clear VMXON state and unlock certain CR4=
 bits.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (level =3D=3D KVM_PUT_RESET_STATE) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D kvm_put_nested_state=
(x86_cpu);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn ret;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> I should have mentioned this, I actually already debugged the same issue =
while
> trying to reproduce the smm int window bug.
> 100% my fault.
>
> I also share the same feeling that this might be yet another 'whack a mol=
e' and
> break somewhere else, but overall it does make sense.

This certainly *is* a 'whack a mole' and I'm sure there are other cases
when one of calls in kvm_arch_put_registers() fails. We need to work on
what's missing so we can expose kvm_vcpu_reset() to VMMs.

>
>
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
>

Thanks!

--=20
Vitaly


