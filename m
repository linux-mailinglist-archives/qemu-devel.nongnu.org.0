Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3E3B0601
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 15:42:09 +0200 (CEST)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvgfI-00051h-4O
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 09:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvgdv-0004Lo-NW
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:40:43 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvgdt-0007ft-Na
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 09:40:43 -0400
Received: from [192.168.100.1] ([82.142.21.22]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuUza-1l5Ei01BVS-00rUFl; Tue, 22 Jun 2021 15:40:26 +0200
Subject: Re: qemu-binfmt-conf.sh: enforce style consistency
To: unai.martinezcorral@ehu.eus, Eric Blake <eblake@redhat.com>
References: <20210620201509.GA9@c22643ce596e>
 <13e577e3-c85a-578e-e33f-dd7affaf00ca@vivier.eu>
 <CAGZZdDEetfWS55-crF8mgEEtoo3eWS6dmSV5Xcv7QS+4MOnxcA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c2502af7-d3c9-04fd-d136-f041f4f18c23@vivier.eu>
Date: Tue, 22 Jun 2021 15:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGZZdDEetfWS55-crF8mgEEtoo3eWS6dmSV5Xcv7QS+4MOnxcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8Dvzpkkw0oncn5TWTTLjTQf0p6RGfgu3mj1HC3knqgHY+8fJ+g0
 KhBraatd1EkD3eJIvwDJKsjt0hnUIPZvilAsxwKorR2UWxfNU6a0aOJ7zpwfmmPGptw7J3O
 bEesstlvcMxF4vNW1JT/aG2Mgqlze9c7Ud6jYXPLl/qYeU5KCpGDVXmqQNUU6gfKjn7nd6/
 izIV90+el9ve7eZky6JIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+xnf+c8CpPA=:GOCfAKWXGOiEMl11FuYtgY
 2/Lfp/Q20Ul6BmO7qpFQsNKYL9ZFp7c8n6AuvuJH+ldgx1shKCBiiHiisxaB2x0VPB6bB5e2i
 5EHhIHUgbZPC3/5BvZcEUpeTFA66zBNn2JjcGht6y3q1MqSTjlCgqdMeMUwLrdzkkVGN92/K0
 XNva1RujMU5rMm2OxjYsoLQMKndH/Clye+dfhQ/YwcOgP9jf9+N+3bmdgQ7U0VzMXcjw4Npwn
 vkoKR5J5P20HZfVRo0XEnORGcN5oTiNmWD7fI+pO7PbER9Z9WWxeiZlKGbpe9iaxkro3jAUHd
 knDqZdoBx0hlNAvlNx20c27tofmLnnKf/+VDWg65adU250vp0UAGb2RIWhCWj+u4xBcdOTqQu
 N6bX6GlYubKqpZpFH8wzLs1c3z/uiwCQynnqCwN2XjXTTtnn6YoQds3Pxt6wk8D9KZ0NxOkyv
 7V6Ud3TmKf+UQGgrrBLk8nq6xkh4Kw8DzPpvw2vP756sgdg666TLFzVK53PIxOQpATExCsiyC
 iGcf5IESkKtaB27e6Jw6hY=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/06/2021 à 23:22, Unai Martinez Corral a écrit :
> Hi Laurent,
> 
>     Well, I'm not sure there is a real consistency with this in the other scripts...
> 
> 
>     Changes look good, but can someone confirm this is the style we want to use everywhere?
> 
>     Peter? 
> 
> 
> Please, see https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02267.html
> <https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02267.html>

OK, so if Eric adds his R-b, I will put the patch in my linux-user branch.

> 
>     Please use your real name, not a nickname.
> 
> 
> Sorry about that. It's 'Unai Martinez-Corral'.
> Shall I resend the patch?

No, I'll update the patch.

Thanks,
Laurent


