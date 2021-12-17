Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F8478956
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 11:59:47 +0100 (CET)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myAxm-00031e-Kk
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 05:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAwV-00018p-1d; Fri, 17 Dec 2021 05:58:27 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myAwT-0006ZE-By; Fri, 17 Dec 2021 05:58:26 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M2fDl-1mvgli1HJv-004AG0; Fri, 17 Dec 2021 11:58:09 +0100
Message-ID: <ccf6ab1b-b895-97fb-36e8-2fbf09418a76@vivier.eu>
Date: Fri, 17 Dec 2021 11:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 28/28] checkpatch: Do not allow deprecated g_memdup()
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-29-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20210903174510.751630-29-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6NEnexmQzBCoQmA6bNps6a0/TntX3VGSN6LNezQcFtncqelRKJK
 5sIJwqpvuU46u4Mu5vGiuO6SuRyLRLk7Qpybe0XuuE6e3f73TY0+2IU4nR4dXmx6MdGzu68
 SLO++7gVaxRW6VC8k+tWjlt9o7BQegziTd1Ll0f1o6qVTQCgeAEsdz7+v8Sqe4ukhg0Ajvo
 GUbyzKXo6R4Ad4dphuWvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FefQycjONOI=:ie1Gyivo7IM0RRo8PTn/pJ
 6n1CvSJLdyOunVFAWWUygO2baINgiuxg2P0FQ6sbevDG/m3HWl60mt2dRtd3LnR8eFuUvyC4p
 ayLWyvT0ZBMMKD19ExcDRS1aOj94GFwy0ty8sn8jqqFbdm1XgET6jN5okl51/kss3Vn5Mcfgb
 2vgdLK9lWj3Z/Sx/ECmHfvjKGksIhv7v0tt4/OzTK0I/5NwMMmkci1S+9RKtxdv0l7OvxjMdX
 cVAjK47/TGkEJPM9Tf+XEbrr/f7t8hvcz4Ii7Vq5ZxIFQIoJlWHC4mo+wA7h6rCK90x+gX/uQ
 60oJtp+FIUKwFxRkR1+qzTYUSMqbWdx5sRFEMElzgDCWRMGMHcXZ5ho+Djpgz981BIUX7gAaO
 qrofdSUrYqfLwVpj157BxP/D9zgQJlqj9jwc14amyWG/L+Xs6DgfKBgvddE2HojXf3JI1TB+a
 wttFuTltNnXVRfvZlOtuB71s5L0W6JNBcprIhYNxmhZHJoB9mpmxpNutiyHWT/nS4mKvBkbwe
 aJK5rtQfu70NYN57kzNA5vEnbRHDTOI16+Z7JXsbwdAD6+8yoe1JZEKGhaQ6KRsJtOt1VTcAz
 xtJcJyRpGISfsyY/YFXzGMlxTLRCb+NOOjmrIHHZ+RtKBUuEUV/n5jflGO2G6XXQWnr1g0Nhz
 URr+HS+bAUi+HqN/bmthr0LyiMX7AVGJBwJ10B6oUwoM8etzd64Y8052Qp8dPIb80WEo=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2021 à 19:45, Philippe Mathieu-Daudé a écrit :
> g_memdup() is insecure and as been deprecated in GLib 2.68.
> QEMU provides the safely equivalent g_memdup2() wrapper.
> 
> Do not allow more g_memdup() calls in the repository, provide
> a hint to use g_memdup2().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   scripts/checkpatch.pl | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index cb8eff233e0..5caa739db48 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2850,6 +2850,11 @@ sub process {
>   			WARN("consider using g_path_get_$1() in preference to g_strdup($1())\n" . $herecurr);
>   		}
>   
> +# enforce g_memdup2() over g_memdup()
> +		if ($line =~ /\bg_memdup\s*\(/) {
> +			ERROR("use g_memdup2() instead of unsafe g_memdup()\n" . $herecurr);
> +		}
> +
>   # recommend qemu_strto* over strto* for numeric conversions
>   		if ($line =~ /\b(strto[^kd].*?)\s*\(/) {
>   			ERROR("consider using qemu_$1 in preference to $1\n" . $herecurr);
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

