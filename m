Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594386B4C7A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafO8-0008O6-F2; Fri, 10 Mar 2023 11:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pafO6-0008NV-5L
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:14:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pafO1-0001iF-IK
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678464864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wjXer+LGzrQtKLC2FHSt+WLkrNsb1e/YqYqYvDFJXw=;
 b=W0DlPsY0blFNkElXP4gcecDWjy+KN+vQHHKhL67WDDH2FEuKqd4fY8mD6Y2MqzVVjYJb8T
 52wV0xTas+qEPUTFFyb22P114NmfAJvrMSBfo0/3U/I0Ib28oEeuzTwIu5BomFFZFtZlmJ
 jS2m4KsH2Mwl0uS1Hjyk7oWzfct4d38=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-umyUnihVMJCJzP_0iGFDsQ-1; Fri, 10 Mar 2023 11:14:23 -0500
X-MC-Unique: umyUnihVMJCJzP_0iGFDsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so2155005wms.9
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 08:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678464862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wjXer+LGzrQtKLC2FHSt+WLkrNsb1e/YqYqYvDFJXw=;
 b=o7Ae6nn0PrWdSJKMzqAdLbttgff0+VS3gO++pIEjLyZh6VsvZ6n9VJOhBHiw2MVT93
 x6LCqCXJbh5ES0VZxfuFNUBmbpfnPpPVO0hh4x1qNTmJuSCIRVxNJcf+RbfTIA3XVgX+
 dV/xH+KwL8agyM9MPpoue/04s3ZoWncmhDdwU7OBeSm8/JWGESuE7HLMFqm4Or47aG/5
 AFP8Nwq5iiS5XUZ7Ajz/QV/Ruuq+D9ML297PcBk7KB3ryT0WxLgnL3Ds3kfCco5ug2HP
 iTxTIdrMYZ4CXY9OTogkDOAL7+qwmYoazPlY6pgUEVG+XSwt1M17H2vJI5Sx14zULMVM
 ScJw==
X-Gm-Message-State: AO0yUKWmTOYhAnU7hr+3aWlPl6lj5P/t0KlLi+4nZ43IzXTXydPeTf7r
 p9CJuVphtgBwGovaXU+9De3zFt4i9aK0yl0sAar6x6dey0TZuHaQswFvi9hDFRPh1IoCzPVxl8S
 fEBps7WMY32vLguM=
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id
 fl10-20020a05600c0b8a00b003eb578dded3mr3196229wmb.35.1678464862339; 
 Fri, 10 Mar 2023 08:14:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/apI2TYLDnXp6CoGrnY48HlMj7/VgpUONK+jr+hhNcvivCNc1hJdY//WpJfYDVRTVRb8XZDQ==
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id
 fl10-20020a05600c0b8a00b003eb578dded3mr3196188wmb.35.1678464861992; 
 Fri, 10 Mar 2023 08:14:21 -0800 (PST)
Received: from [192.168.2.110] (p549d1c92.dip0.t-ipconnect.de. [84.157.28.146])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adffe45000000b002c5801aa9b0sm185030wrs.40.2023.03.10.08.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 08:14:21 -0800 (PST)
Message-ID: <dc35fc70-c609-09db-15f1-e59933cb1afd@redhat.com>
Date: Fri, 10 Mar 2023 17:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org> <87h6useoxy.fsf@suse.de>
 <0a2fcaf6-169e-a947-c03f-3aadba10da73@redhat.com> <877cvoehxo.fsf@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <877cvoehxo.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/03/2023 16.37, Fabiano Rosas wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 10/03/2023 14.06, Fabiano Rosas wrote:
>>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>>
>>>> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>>>>> It is possible to have a build with both TCG and KVM disabled due to
>>>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>>>> host.
>>>>>
>>>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>>>
>>>>> Fix tests that crash or hang in the above scenario. Do not include any
>>>>> test cases if TCG and KVM are missing.
>>>>>
>>>>> Make sure that calls to qtest_has_accel are placed after g_test_init
>>>>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>>>>> printed before other messages") to avoid TAP parsing errors.
>>>>>
>>>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>>>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>>>
>>>> I don't like it that we are hard-coding the list of accelerators
>>>> like this. Make a wrapper?
>>>>
>>>
>>> Are you thinking of some sort of "has_any_accel" wrapper?
>>
>> I think in the long run, we want something like what I described here:
>>
>> https://lore.kernel.org/qemu-devel/ee0cad00-a6f3-f0c1-adf0-ba32329354f3@redhat.com/
>>
> 
> Wont't that function be too generic? The choice of accelerator is quite
> specific to each individual test, some might not work with TCG, some
> might not work with HVF and so on. There is no link between build-time
> configuration and runtime test execution after all. We could always have
> a build without an accelerator and then try to run a test that uses that
> accelerator. And also have an accelerator present that the test does not
> support at all.
> 
> 
> For this particularly bizarre case of not having TCG nor KVM in the
> build I'm inclined to go with Michael's suggestion of checking it at
> build time and skipping all the hassle. This is what I'm preparing:
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 29a4efb4c2..e698cdcb60 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -27,6 +27,12 @@ if config_host.has_key('CONFIG_MODULES')
>     qtests_generic += [ 'modules-test' ]
>   endif
>   
> +# For x86_64, i386 and aarch64 it is possible to have only Xen as an
> +# accelerator. Some tests require either TCG or KVM, so make sure they
> +# are present before building those tests.
> +tcg_or_kvm_available = (config_all.has_key('CONFIG_TCG') or
> +                        config_all.has_key('CONFIG_KVM'))
> +
>   qtests_pci = \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
>     (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
> @@ -40,11 +46,12 @@ qtests_filter = \
>     (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
>   
>   qtests_i386 = \
> -  (slirp.found() ? ['pxe-test'] : []) + \
> +  (slirp.found() and tcg_or_kvm_available ? ['pxe-test'] : []) +                            \
> ---
> 
> What do you think?

It's likely ok as additional check for Xen-only builds, but we certainly 
cannot remove the runtime checks for KVM (it's perfectly fine to have KVM 
included during compilation - but unavailable during runtime (e.g. if the 
kernel module is not loaded).

  Thomas


