Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5F446E54
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 15:32:19 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjMjy-00037q-6c
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 10:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjMib-0001Xf-O8
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:30:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjMiZ-00076I-QU
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 10:30:53 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r8so18318054wra.7
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=++rer83lzAohF7sqH8jGVdKgkGI6pQMpsx2kMypf2P0=;
 b=acjb5VUrK5BNxgcRCQZz9fM8jeuJHpu7xnk/UVfOXnQym6FslxMKkfZ3qGIENM9Hnl
 r8w45t2ZXD/FCM6CVtRUxrYyK0E4vI1wWbI75z1isg5JiUPrbPsGwtXKg25/xigMA4v3
 DwzOdvuxdxOBcSkCM0VZZxUyi2bS3DL5Ib4Nej8O/cHjELxj9nUGOI3QRklidMaAk157
 1GxR+dQ0NaVymAqgZ0YnGHEqUfH8TRnIme7D3NwMBdvm0QrVrWrPUWZGLPBBfvWTF0j9
 JQXuvuTIH6GXPMkfCPzA+sK7DXxU+CI9f/593JyTW+dLwY1KqDY5hPk9+EiLHxeHGoDy
 O1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=++rer83lzAohF7sqH8jGVdKgkGI6pQMpsx2kMypf2P0=;
 b=p7PXapRCgVOP4yBmrhJ2j5d0TlG6CdoQzF+8fMYc3/t4q9I6e0UdoT7z/uMxXgjEnq
 DH3LK9KlR90UlIxiCMphs9WtZ52nEnKZEVWGJJ4xq5/5kOwvwKd4CuWAi1jymqxFBj6s
 cKtNaNF1bpKmNepB7Lu6Cku61EPJ23pweQkjfdeKcrshJOZU7Q4IYu89fk9oluyaGqor
 5AMhIY+sH5zAiLAZZHNj9JgueaoLZCKdkYkPKsmms7KBkowE34DVqFU3WQo6j3ync59r
 wgfsPUO2JygJKbswQ2U85mCqjcU58psGLa4QklYe5Kp+T/XDKH/l4SiOSd4DKmZAuCDM
 TjQg==
X-Gm-Message-State: AOAM532SBcWorGNwcNlzyFxQ7jjXwWkdiK2ieYnZfjkzjtatIBkHb+MY
 pKkRA8IOGqo03QGSPoa93Fk=
X-Google-Smtp-Source: ABdhPJzsmxm+/zpphhpd57fNY/csLAmgsnYvGraz4CPrYtgiFQu1co4mmE+bwqzXVOXXrug+mM6/1Q==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr51243469wrs.219.1636209045301; 
 Sat, 06 Nov 2021 07:30:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n1sm9070857wmq.6.2021.11.06.07.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 07:30:44 -0700 (PDT)
Message-ID: <66978f50-1064-4832-e080-f0f4a964e324@amsat.org>
Date: Sat, 6 Nov 2021 15:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
Content-Language: en-US
To: wainersm@redhat.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Warner Losh <imp@bsdimp.com>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
 <YMjdCjNOyUnprhd8@redhat.com> <YMjhFXKFi2H+Zkme@redhat.com>
 <d4ee4cf1-26e9-7344-f29f-ed242464e9dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <d4ee4cf1-26e9-7344-f29f-ed242464e9dc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.407,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 6/15/21 19:40, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 6/15/21 2:19 PM, Daniel P. Berrangé wrote:
>> On Tue, Jun 15, 2021 at 06:02:02PM +0100, Daniel P. Berrangé wrote:
>>> On Mon, May 31, 2021 at 05:53:25PM -0300, Wainer dos Santos Moschetta
>>> wrote:
>>>> Hi,
>>>>
>>>> On 5/31/21 7:03 AM, Philippe Mathieu-Daudé wrote:
>>>>> Install more dependencies to increase code coverage.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>>    tests/vm/freebsd | 5 +++++
>>>>>    1 file changed, 5 insertions(+)
>>>> With or without this patch I got an error when `make
>>>> vm-build-freebsd`. It
>>>> fails to install packages.
>>>>
>>>> For example, with this patch I got:
>>>>
>>>> < Output omitted>
>>>>
>>>> ### Installing packages ...
>>>> Failed to prepare guest environment
>>>> Traceback (most recent call last):
>>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in main
>>>>      return vm.build_image(args.image)
>>>>    File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in
>>>> build_image
>>>>      self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
>>>> ssh_root_check
>>>>      self._ssh_do(self._config["root_user"], cmd, True)
>>>>    File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in
>>>> _ssh_do
>>>>      raise Exception("SSH command failed: %s" % cmd)
>>>> Exception: SSH command failed: pkg install -y git pkgconf bzip2
>>>> python37
>>>> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo
>>>> png sdl2
>>>> gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
>>>>
>>>> Is it a known issue?
>>> Hard to actually tell what the error really is. This message is
>>> only giving the command that was invoked, but seems to have thrown
>>> away stdout/stderr which would have the messages telling us what
>>> went wrong.  This lack of error reporting in basevm.py so badly
>>> needs to be fixed, otherwise we're working blind when debugging
>>> failures.
>> Hmm, when I try the same command, it *does* print all the output
>> so you can see what's going on, but it doesn't actually fail for
>> me either (without this patch).
> 
> Thomas sent me a message in private while ago that the error could be
> related with the amount of ssh keys in my agent-ssh. I didn' t check
> that hypothesis yet; will debug a littler further and let you all posted.
> 
> ah, if this problem cannot be reproduced on other machines....I see no
> reason to hold this patch.

OK thank you!

