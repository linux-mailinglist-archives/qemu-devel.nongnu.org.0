Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CA83DE9BB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:35:06 +0200 (CEST)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAqpE-0004fo-Tg
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqny-0003mg-Nf
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:33:46 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAqnw-0000KN-Ka
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:33:46 -0400
Received: by mail-ed1-x531.google.com with SMTP id y7so25922218eda.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iP/a0dnefqzR6d/NhlA57ttT+oFfV96Z34Mks0ReFa0=;
 b=gAajY+PaxAs9dxx2tB0oC1NZoRohvlsXBsNaBa+l34L6qR5NSy1pwN7E41RX7SkdJW
 9nzRQF5zKTaKjMEMxXodBOVcNxs81c4YJKDJE7MZEapHIEimi1+/IR3nvG92s64pxTDa
 SpcnbeJT0F1i4YFt8RHSlFF8dGlGVm5ARQZqTdRvf6DobIUxM1aD5DuISAYJvRrghmgS
 fIy8wYqbHz79Z+mncp/w49TPe6A5OrInrq3Dc8kEgi8htdhiNC9yeE4Bfl2fnTb7vM3e
 YQwmtEgjUYd9Sh6OZj1kPzn8BG3f6E+VmpuveIbNNubsrkhGKzT/6+KcznuY6S3wGZne
 huyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iP/a0dnefqzR6d/NhlA57ttT+oFfV96Z34Mks0ReFa0=;
 b=o8atAsIARk3mx4oE0uM2M28Hp6+ytOpoyERuddek41uNgCS+qHub21eM1v0K4lYoxa
 tT/HQLTSmfuWFTrEEl63rmZ2awFeNUBQpwrK8K6R0AgyuLCX+i4LRI+dFou+T19rbaw3
 m9s/PPmdUlH+9/xwXb1olEFXYZ7+6UM7P5CR9jr4EIaDF6bIHIMyDZbPH32CFPmS7XjM
 CUcJpuIFrsVwAyMRcFF9pCQQK64mIAEtbRnUFsphvd5HzxRO1dvLmEfBe4zkXsc0h7Aw
 6fBnpr+nlQup2yUB6QGUXQYN6giEdZ8oj+LRhG1+f+vg88xRtrw18vIJ4jLDGXInSL59
 L4IQ==
X-Gm-Message-State: AOAM53268jqQjpTMQl4dMsbaZmB8MsUnoMQE6rbKCcmGXERBGbFyQSqj
 P6DS5vqTTK8ar9zX6PJnm7ZuVZ0cy1QEBhknt9koToDkm2I=
X-Google-Smtp-Source: ABdhPJwNlpyyPGmflmWur3LOJrYZCZ7TEZdM1RlxC9hWE2T82lAvydCydAgCdMWzsjuJ37Vo/A9mMf8oK3Wz6Y0bOfo=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr20015190ejb.56.1627981754057; 
 Tue, 03 Aug 2021 02:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
 <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
 <CAFEAcA9jagAAWuJRxYJ6OQg72n4uoV1PT3dgSxNOYJFpW5xi+g@mail.gmail.com>
 <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
In-Reply-To: <CAJ+F1CJ79-ZrE2J8XZaoBt3LzprB0Z4YJb7cU_hvQf8qd84L1g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 10:08:30 +0100
Message-ID: <CAFEAcA8saN260spE0BPD_++2zasVrsyYzaP_YBMfcPRzv+nxSg@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 09:30, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> On Tue, Aug 3, 2021 at 12:55 AM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>> This one is still here:
>>
>> subprojects/libslirp/libslirp.so.0.3.1.p/src_arp_table.c.o: In
>> function `arp_table_add':
>> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>> /mnt/nvmedisk/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
>> undefined reference to `__ubsan_handle_type_mismatch_v1'
>>
>> when building the subprojects/libslirp/libslirp.so.0.3.1
>>
>> configure options:
>> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
>> '--extra-cflags=3D-fsanitize=3Dundefined  -fno-sanitize=3Dshift-base
>> -Werror'
>
>
> I am not able to reproduce. Could you check the value of default_library =
for libslirp when you run "meson configure". It should be "static".

I never run "meson configure". I just run the QEMU "make".

Are you testing by starting with a before-the-libslirp-merge
change QEMU, doing a build, then updating to the libslirp
changes, and then doing a 'make' without reconfigure or
'make clean' ? I suspect this is perhaps to do with it being
an incremental build.

>> This happens because (as noted in the clang documentation for the
>> sanitizer: https://clang.llvm.org/docs/AddressSanitizer.html)
>> when linking a shared library with the sanitizers, clang does not
>> link in the sanitizer runtime library. That library is linked in
>> with the executable, and the shared library's references to the
>> sanitizer runtime functions are satisfied that way. However
>> you/meson are building libslirp.so with -Wl,--no-undefined
>> so the link of the .so fails.
>> (This does not happen with gcc, because gcc chose to make the
>> default for sanitizers to be to link against a shared libasan,
>> not a static one, the reverse of clang's default.)
>>
>> What I don't understand is why we're building the .so at all.
>> I just tried a fresh build with
>> '../../configure' '--cc=3Dclang' '--cxx=3Dclang++' '--enable-gtk'
>> '--enable-sanitizers'
>> to check that telling configure (and possibly thus meson) about
>> the sanitizers more directly still demonstrated the problem:
>> but that sidesteps it because it never builds the .so.
>> My other build directories (the ones that do plain old gcc
>> builds with no sanitizer) seem to have built the .so file
>> as well, though, so this isn't related to either clang or to
>> the sanitizers -- meson just doesn't seem to be consistent
>> about what we build.
>>
>> A related meson bug:
>> https://github.com/mesonbuild/meson/issues/764
>> (which was closed by just making meson warn if you tell it
>> to both use --no-undefined (which is the default) and to use
>> the sanitizer.)
>>
>> The ideal fix seems to me to be to figure out why we're
>> building the libslirp .so and not do that.
>>
>> A simple fix/workaround would be to set "b_lundef =3D false" in
>> default_options in your meson.build (which will suppress the
>> -Wl,--no-undefined option). That does mean you won't get
>> any warnings if you accidentally make libslirp use a function
>> that is provided by the QEMU executable, I suppose.
>>
>
> What if you pass --extra-ldflags=3D'-fsanitize=3Dundefined' then?

-fsanitize=3Dundefined is already in the ldflags. That doesn't
help because clang is still going to decide not to statically
link libasan and give an error because of -Wl,--noundefined.

-- PMM

