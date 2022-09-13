Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BD5B7272
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:56:50 +0200 (CEST)
Received: from localhost ([::1]:49380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY7LE-0005Ys-Lj
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY7CZ-0007cL-Df
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:47:51 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oY7CX-000208-Mk
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:47:51 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M597q-1oZDey3sY8-0017jF; Tue, 13 Sep 2022 16:47:41 +0200
Message-ID: <8a51c3d7-e21d-ba1e-f320-9e17a31d3c09@vivier.eu>
Date: Tue, 13 Sep 2022 16:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/2] target/m68k: Perform writback before modifying SR
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <20220913142818.7802-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220913142818.7802-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Aoi5WY9z/TsnkESAOFcDitoff0Cz6XYZhhdNPVKxFVyPOC1MgMk
 bs/2PBvW4Ogim6BRWjl/t6eIr9z+K4FModuux/NGOCy79pJQTHUvBQ2I43E8FEzjhLBRXbU
 yiNn9fY0LAdNI6/VuToiNQwNkgRvWunMESRcDhwsKq25wi1WNydsiVhyq6THveS4+hUCU28
 5LPQucYVgKxFn/6Su0aTg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/X87c8w2bM=:1Z/+59gj2EJueMtDPaFezN
 bmnIAlqQzQySiEf00ORIqAmSZDmd8TLISDVFiJdUGLI2mt/ZFBYRA05Dt/98/SqF0lqC/P4p9
 sJNLA9usOFpVH8dNJmCCpfplYYfz8Qv0eS6L0L/imiE46CLtWLiBd+72Ql30k8ECUklJZdBiz
 y/wJPEp2UTwnZX+vM1pt3s0GY+sFpXcwfFX0uZvt6b+DKaO8UBrPjgeIg1vgOtd32/tsvvG3/
 Bq/jJ+paW44Ai+KL6QJrRDxU+ebgqvJocj6akNY6kpn1/nA9hVAPBiUr4mXnFE/3gNITl33Pt
 h70HAaq8fE0KCye3mz9tZhJp1GIMHWlIVh1AE9t9LJpENgEWV88j8amw361wkd/drn5awsg3s
 IYNkQjNWbS7LB4mMhu0rflaE2KmxZ4qA09HR8ipbqZM+7TiK4c50Qy3dN4no0T6JgSkFPnQxc
 ZqpAUszIZHxHq9tuycDSHm0jzOA5LEVycW5scbrjenPM4mcBqldUs4zr0PJBw5EdUB1vDwWwx
 xi1GnT/sIUaMG9f+8+ODI/fPH9nU9au1lp5UcqLhKRV4tn4c1JqC/kwlSae+9sTgMdNEEuh9P
 5zNyE/MMOhv9XmVyRz+WkxzFuzJEaxHjUk8lTtCUdbhNaqTDmZbHFZl0LV81SIXM86b52Ahxw
 CC7PRIZdMMU3oyE9AOy9IhOyuw/ZtrRPifHv6Fm8OE9K3Iuk6+n/OjosydBQPsqJ7VZ82GqC4
 nlDuTqISn3RVcJDMJKyqkutKHnBhfCZA/vns3+zJN6+88HLMNmzqdFchsY3rPUQ2upwwY0t8T
 z1/9afO
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 13/09/2022 à 16:28, Richard Henderson a écrit :
> Writes to SR may change security state, which may involve
> a swap of %ssp with %usp as reflected in %a7.  Finish the
> writeback of %sp@+ before swapping stack pointers.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1206
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


