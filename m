Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC5365582
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:36:18 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYmnp-00029q-4s
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYmmu-0001hS-5x
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:35:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYmms-0000Cq-52
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:35:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id g9so20850098wrx.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3nlBpXCDpJxdrxSmW/MUN8/3S6js/PHE6ukyDppXr3U=;
 b=P7KEPkUgVtKI/4RjBO4ETyaMKO+qes2qiQnJHKn2jw5J8+FUzFrn/sN8vCrLCFXqGB
 kBPpOgJ99NYcXgjuZ/J1/b3A+U4gZKqlUTQ+lx2M4DsgiDMgj7GuHJgjaGQPzIuoMXzL
 n1dRdepxWBhk2eqdXM+DD8jmEuioLGkd9OKSPU/rTeOw0/YGUjt2yEQEa+1Yj3R4A7eL
 3M2wj/m5J1DMG2iQWtewSBtHm2+VcLFT+A0oAHV21CI8XUHil06ZbuJFBLZUolaIo7gI
 doit5gNFw+xs11y2raCTuyYyRyWbNMkcu6nngyV69LbqnOFw3ObGW88x2a4eGCs+q77u
 t8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3nlBpXCDpJxdrxSmW/MUN8/3S6js/PHE6ukyDppXr3U=;
 b=p87dCKICQdeSsxOjyTVd+IoAqWjghJIwFzawrfvGIo9Rqd+Nl1gv4s9q0ptLe21qIE
 f+ySvmQZIln5nhBxHKCb6BZSK0WLMmRzf2Hi1jAMa2WfJrZ+EJyzeSEQ4/3kXl4q3Lk+
 THoYdCLi5g8qKSPJBzVB0PiejjJ96U9wOpRX8HPQXUhm2qQGWA001jQKaWFY6yFH7Rq3
 n7Nm8p5IBHFrwz72zQ8KwKGRHboUEFZw1Uk9xiBSAn5B/Y9nVtIVl+DUs9JDuRDR/wLn
 W7zi5YB8spQepbPdzP388DOwXHrcElhoUtNyjRool6pKKLy+ldqHxEDfHBYQMLWmua5A
 c9YA==
X-Gm-Message-State: AOAM531IU3iMKBDC1AAcm9yxcNRx8ZGqA3grhWILNsAsXQe91XaKCr49
 HiRYCzM1QQlNAUQS3o4Huj934w==
X-Google-Smtp-Source: ABdhPJzpisPHDQj5j2a3zfmOv4uwpKNimimjYMALV9enmsnOIjIog0599I+V1B/vk16k7VuS/wXQ8w==
X-Received: by 2002:adf:9567:: with SMTP id 94mr19586836wrs.401.1618911316582; 
 Tue, 20 Apr 2021 02:35:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x2sm29610935wrg.31.2021.04.20.02.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 02:35:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2E991FF7E;
 Tue, 20 Apr 2021 10:35:14 +0100 (BST)
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-53-cfontana@suse.de>
 <75c0236b-a8f1-c462-355b-945e509d90f5@redhat.com>
 <50171d6a-21dc-3017-c8f9-8d068fd843f5@suse.de>
 <653b0188-c909-ba0c-00b2-735fb25d6703@redhat.com>
 <3ab0e4d3-1494-95cf-e4a9-1b9ef968e7b9@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v14 52/80] tests: device-introspect-test: cope with ARM
 TCG-only devices
Date: Tue, 20 Apr 2021 10:34:36 +0100
In-reply-to: <3ab0e4d3-1494-95cf-e4a9-1b9ef968e7b9@suse.de>
Message-ID: <87y2dd8fjh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 4/19/21 12:29 PM, Thomas Huth wrote:
>> On 19/04/2021 12.24, Claudio Fontana wrote:
>>> On 4/19/21 12:22 PM, Thomas Huth wrote:
>>>> On 16/04/2021 18.27, Claudio Fontana wrote:
>>>>> Skip the test_device_intro_concrete for now for ARM KVM-only build,
>>>>> as on ARM we currently build devices for ARM that are not
>>>>> compatible with a KVM-only build.
>>>>>
>>>>> We can remove this workaround when we fix this in KConfig etc,
>>>>> and we only list and build machines that are compatible with KVM
>>>>> for KVM-only builds.
>>>>>
>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>> ---
>>>>>    tests/qtest/device-introspect-test.c | 18 ++++++++++++++++++
>>>>>    1 file changed, 18 insertions(+)
>>>>>
>>>>> diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/devic=
e-introspect-test.c
>>>>> index bbec166dbc..1ff15e2247 100644
>>>>> --- a/tests/qtest/device-introspect-test.c
>>>>> +++ b/tests/qtest/device-introspect-test.c
>>>>> @@ -329,12 +329,30 @@ int main(int argc, char **argv)
>>>>>        qtest_add_func("device/introspect/none", test_device_intro_non=
e);
>>>>>        qtest_add_func("device/introspect/abstract", test_device_intro=
_abstract);
>>>>>        qtest_add_func("device/introspect/abstract-interfaces", test_a=
bstract_interfaces);
>>>>> +
>>>>> +    /*
>>>>> +     * XXX currently we build also boards for ARM that are incompati=
ble with KVM.
>>>>> +     * We therefore need to check this explicitly, and only test vir=
t for kvm-only
>>>>> +     * arm builds.
>>>>> +     * After we do the work of Kconfig etc to ensure that only KVM-c=
ompatible boards
>>>>> +     * are built for the kvm-only build, we could remove this.
>>>>> +     */
>>>>> +#ifndef CONFIG_TCG
>>>>> +    {
>>>>> +        const char *arch =3D qtest_get_arch();
>>>>> +        if (strcmp(arch, "arm") =3D=3D 0 || strcmp(arch, "aarch64") =
=3D=3D 0) {
>>>>> +            goto add_machine_test_done;
>>>>> +        }
>>>>> +    }
>>>>> +#endif /* !CONFIG_TCG */
>>>>>        if (g_test_quick()) {
>>>>>            qtest_add_data_func("device/introspect/concrete/defaults/n=
one",
>>>>>                                g_strdup(common_args), test_device_int=
ro_concrete);
>>>>>        } else {
>>>>>            qtest_cb_for_every_machine(add_machine_test_case, true);
>>>>>        }
>>>>> +    goto add_machine_test_done;
>>>>
>>>> That last goto does not make much sense, since the label is right belo=
w.
>>>
>>> It is necessary to remove the warning that is otherwise produced about =
the unused label IIRC.
>>=20
>> Ah, ok.
>>=20
>> Alternatively, you could maybe also drop the label completely and simply=
=20
>> write the #ifndef block above like this (note the "else"):
>>=20
>> #ifndef CONFIG_TCG
>>      const char *arch =3D qtest_get_arch();
>>      if (!strcmp(arch, "arm") || !strcmp(arch, "aarch64")) {
>>          /* Do nothing */
>>      }
>>      else
>> #endif /* !CONFIG_TCG */
>>=20
>> ... not sure what's nicer, though.
>>=20
>>   Thomas
>>=20
>
> Indeed, I tried a couple of combinations, in the end to me the less confu=
sing was the goto one,
> the #ifdef containing an open else is in my opinion worse, more
> error-prone, but I am open to additional comments/ideas.

Surely a helper makes intent clearer?

  /*
   * XXX currently we build also boards for ARM that are incompatible with =
KVM.
   * We therefore need to check this explicitly, and only test virt for kvm=
-only
   * arm builds.
   * After we do the work of Kconfig etc to ensure that only KVM-compatible=
 boards
   * are built for the kvm-only build, we could remove this.
   */
  static bool skip_machine_tests(void)
  {
  #ifndef CONFIG_TCG
      const char *arch =3D qtest_get_arch();
      if (strcmp(arch, "arm") =3D=3D 0 || strcmp(arch, "aarch64") =3D=3D 0)=
 {
          return true;
      }
  #endif /* !CONFIG_TCG */
      return false;
  }


  int main(int argc, char **argv)
  {
      g_test_init(&argc, &argv, NULL);

      qtest_add_func("device/introspect/list", test_device_intro_list);
      qtest_add_func("device/introspect/list-fields", test_qom_list_fields);
      qtest_add_func("device/introspect/none", test_device_intro_none);
      qtest_add_func("device/introspect/abstract", test_device_intro_abstra=
ct);
      qtest_add_func("device/introspect/abstract-interfaces", test_abstract=
_interfaces);

      if (!skip_machine_tests()) {
          if (g_test_quick()) {
              qtest_add_data_func("device/introspect/concrete/defaults/none=
",
                                  g_strdup(common_args), test_device_intro_=
concrete);
          } else {
              qtest_cb_for_every_machine(add_machine_test_case, true);
          }
      }

      return g_test_run();
  }


>
> Thanks,
>
> Claudio


--=20
Alex Benn=C3=A9e

