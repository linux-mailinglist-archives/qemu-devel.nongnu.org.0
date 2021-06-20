Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6733AE072
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 22:51:35 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv4Pj-0002Q0-9v
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 16:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lv4Om-0001i7-Nb
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:50:32 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lv4Ok-0005sw-M6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 16:50:32 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MkpnF-1lQN190mKN-00mJY3; Sun, 20 Jun 2021 22:50:20 +0200
To: umarcor <unai.martinezcorral@ehu.eus>
References: <20210620201509.GA9@c22643ce596e>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: qemu-binfmt-conf.sh: enforce style consistency
Message-ID: <13e577e3-c85a-578e-e33f-dd7affaf00ca@vivier.eu>
Date: Sun, 20 Jun 2021 22:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210620201509.GA9@c22643ce596e>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nnzJ0JcICPdKdK8QLJe8gBAWYCQgvd0Q6OY3tfGAZykk5hPm+Av
 RwdtZqHAcY3GBu5WLeMejfzAeGs2ZJpABNe5PYM+icszXlw2Mtsm77N75+NqJnydVl1J+Wx
 3xoKGgnBUPb06K5IwksW8RLnDgUcH4zge0NYTmreYNZsEjVR2D/pvGx3LHlKX506TThvX3X
 KJfT/De8LbLj/+wZGdJyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MdadMAZQdcA=:jmURK4hVQj4syaPdaQDzUM
 gyx7VHkNxXVtkRpNOzsKJm/pZDE6jdA2Uusf/HgMof2djKV3S4pPB9xyRitjoztACok9Qi9fR
 IPdIbqOkahPOtOYPHUOnnJu0pNIH3WFuhPr9sq+kNMDIV+y6rKy19oxr53BctlsfqWvTlfftM
 pJ3j7h6LRlNsZ44AIHujWEYJWK5/ExniMZk4iifHWn67QKhPdPNRl623Dj5OHD8i8zngIKb82
 T/s7MZAx3xlU1IgLtHfzj3gr0G+lXfVAwGfNu73eLDYSmpO0TClcxNKTFl+rWSldrpJIXgpzO
 r3reGeB+DUVBlxBusNZifwLOGGqVxCR2cPwbFFkKP1EhaITVRt7cKa7h23m4VXmeQKrmq2E4S
 tLa+SKUfRVR9VwTyuesgNRl3VYX3alz64WAJkfwU6DBJBGVc3eCo9DYDU5hCj01SNui0w+h+6
 nIQDjBXtHPWY1511wQZTYsNyk9yAViw+VmlJYv8sKcEiubgfbOzqIjroGpeTfqj0h3zFTBjod
 EK+CrmUNffMESryRwYZzYk=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/06/2021 à 22:15, umarcor a écrit :
> Spaces are removed before '; then', for consistency with other scripts
> in the project.

Well, I'm not sure there is a real consistency with this in the other scripts...

> Signed-off-by: umarcor <unai.martinezcorral@ehu.eus>

Please use your real name, not a nickname.

Changes look good, but can someone confirm this is the style we want to use everywhere?

Peter?

Thanks,
Laurent

> ---
>  scripts/qemu-binfmt-conf.sh | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 7de996d536..13bff41b47 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -221,7 +221,7 @@ EOF
>  }
> 
>  qemu_check_access() {
> -    if [ ! -w "$1" ] ; then
> +    if [ ! -w "$1" ]; then
>          echo "ERROR: cannot write to $1" 1>&2
>          exit 1
>      fi
> @@ -230,12 +230,12 @@ qemu_check_access() {
>  qemu_check_bintfmt_misc() {
>      # load the binfmt_misc module
>      if [ ! -d /proc/sys/fs/binfmt_misc ]; then
> -      if ! /sbin/modprobe binfmt_misc ; then
> +      if ! /sbin/modprobe binfmt_misc; then
>            exit 1
>        fi
>      fi
>      if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
> -      if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc ; then
> +      if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc; then
>            exit 1
>        fi
>      fi
> @@ -248,16 +248,16 @@ installed_dpkg() {
>  }
> 
>  qemu_check_debian() {
> -    if [ ! -e /etc/debian_version ] ; then
> +    if [ ! -e /etc/debian_version ]; then
>          echo "WARNING: your system is not a Debian based distro" 1>&2
> -    elif ! installed_dpkg binfmt-support ; then
> +    elif ! installed_dpkg binfmt-support; then
>          echo "WARNING: package binfmt-support is needed" 1>&2
>      fi
>      qemu_check_access "$EXPORTDIR"
>  }
> 
>  qemu_check_systemd() {
> -    if ! systemctl -q is-enabled systemd-binfmt.service ; then
> +    if ! systemctl -q is-enabled systemd-binfmt.service; then
>          echo "WARNING: systemd-binfmt.service is missing or disabled" 1>&2
>      fi
>      qemu_check_access "$EXPORTDIR"
> @@ -265,13 +265,13 @@ qemu_check_systemd() {
> 
>  qemu_generate_register() {
>      flags=""
> -    if [ "$CREDENTIAL" = "yes" ] ; then
> +    if [ "$CREDENTIAL" = "yes" ]; then
>          flags="OC"
>      fi
> -    if [ "$PERSISTENT" = "yes" ] ; then
> +    if [ "$PERSISTENT" = "yes" ]; then
>          flags="${flags}F"
>      fi
> -    if [ "$PRESERVE_ARG0" = "yes" ] ; then
> +    if [ "$PRESERVE_ARG0" = "yes" ]; then
>          flags="${flags}P"
>      fi
> 
> @@ -306,23 +306,23 @@ qemu_set_binfmts() {
> 
>      # register the interpreter for each cpu except for the native one
> 
> -    for cpu in ${qemu_target_list} ; do
> +    for cpu in ${qemu_target_list}; do
>          magic=$(eval echo \$${cpu}_magic)
>          mask=$(eval echo \$${cpu}_mask)
>          family=$(eval echo \$${cpu}_family)
> 
> -        if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ] ; then
> +        if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ]; then
>              echo "INTERNAL ERROR: unknown cpu $cpu" 1>&2
>              continue
>          fi
> 
>          qemu="$QEMU_PATH/qemu-$cpu"
> -        if [ "$cpu" = "i486" ] ; then
> +        if [ "$cpu" = "i486" ]; then
>              qemu="$QEMU_PATH/qemu-i386"
>          fi
> 
>          qemu="$qemu$QEMU_SUFFIX"
> -        if [ "$host_family" != "$family" ] ; then
> +        if [ "$host_family" != "$family" ]; then
>              $BINFMT_SET
>          fi
>      done
> @@ -343,7 +343,7 @@ QEMU_SUFFIX=""
>  options=$(getopt -o ds:Q:S:e:hc:p:g: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent:,preserve-argv0: -- "$@")
>  eval set -- "$options"
> 
> -while true ; do
> +while true; do
>      case "$1" in
>      -d|--debian)
>          CHECK=qemu_check_debian
> @@ -356,14 +356,14 @@ while true ; do
>          EXPORTDIR=${EXPORTDIR:-$SYSTEMDDIR}
>          shift
>          # check given cpu is in the supported CPU list
> -        if [ "$1" != "ALL" ] ; then
> -            for cpu in ${qemu_target_list} ; do
> -                if [ "$cpu" = "$1" ] ; then
> +        if [ "$1" != "ALL" ]; then
> +            for cpu in ${qemu_target_list}; do
> +                if [ "$cpu" = "$1" ]; then
>                      break
>                  fi
>              done
> 
> -            if [ "$cpu" = "$1" ] ; then
> +            if [ "$cpu" = "$1" ]; then
>                  qemu_target_list="$1"
>              else
>                  echo "ERROR: unknown CPU \"$1\"" 1>&2
> --
> 2.32.0
> 


